import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:tasks/models/sort_by.dart';
import 'package:tasks/models/sub_task.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';
import 'package:tasks/utils/methods.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial());

  StreamSubscription? _activeTaskListSubscription;
  StreamSubscription? _taskListsSubscription;
  late Box<Tlist> taskListsBox;
  late Box<dynamic> tasksBox;
  late Box<dynamic> settingsBox;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {
        taskListsBox = await Hive.openBox<Tlist>('taskLists');
        tasksBox = await Hive.openBox('tasks');
        settingsBox = Hive.box('settings');

        if (taskListsBox.isEmpty) {
          final defaultTlist = Tlist(
            id: DateTime.now().toIso8601String(),
            name: 'My Tasks',
          );
          taskListsBox.add(defaultTlist);
          settingsBox.put('activeTlist', defaultTlist);
        }
        final taskLists = taskListsBox.values.toList();
        final activeTaskList = settingsBox.get('activeTlist')!;
        add(HomeEvent.updateTaskLists(taskLists));
        add(HomeEvent.updateActiveTaskList(activeTaskList));

        _taskListsSubscription?.cancel();
        _taskListsSubscription = taskListsBox.watch().listen((_) {
          final taskLists = taskListsBox.values.toList();
          add(HomeEvent.updateTaskLists(taskLists));
        });
      },
      updateTaskLists: (e) async* {
        yield state.copyWith(taskLists: e.taskLists);
      },
      updateActiveTaskList: (e) async* {
        settingsBox.put('activeTlist', e.taskList);
        yield state.copyWith(activeTaskList: e.taskList);

        if (e.taskList.tasks.isEmpty) {
          final tasks = (tasksBox.get(e.taskList.id, defaultValue: []) as List)
              .cast<Task>();
          final sortedTasks = sortTasks(e.taskList, tasks);
          yield state.copyWith(
              activeTaskList: e.taskList.copyWith(tasks: sortedTasks));
        }
        _activeTaskListSubscription?.cancel();
        _activeTaskListSubscription =
            tasksBox.watch(key: e.taskList.id).listen((event) {
          if (!event.deleted) {
            final tasks =
                (tasksBox.get(e.taskList.id, defaultValue: []) as List)
                    .cast<Task>();
            final sortedTasks = sortTasks(e.taskList, tasks);
            add(HomeEvent.updateActiveTaskList(
                e.taskList.copyWith(tasks: sortedTasks)));
          }
        });
      },
      addTask: (e) async* {
        final activeTaskList = state.activeTaskList!;
        final tasks = List<Task>.from(activeTaskList.tasks);
        tasks.add(e.task.copyWith(order: tasks.length));
        tasksBox.put(activeTaskList.id, tasks);
        _scheduleTaskNotification(e.task);
      },
      updateTask: (e) async* {
        final taskList = _getTaskList(
          taskListId: e.taskListId,
          taskList: state.activeTaskList!,
        );
        final tasks = List<Task>.from(taskList.tasks);
        final idx = tasks.indexWhere((element) => element.id == e.task.id);
        if (idx >= 0) {
          _scheduleTaskNotification(e.task);
          tasks[idx] = e.task;
          tasksBox.put(taskList.id, tasks);
        }
      },
      deleteTask: (e) async* {
        final taskList = _getTaskList(
          taskListId: e.taskListId,
          taskList: state.activeTaskList!,
        );
        final tasks = List<Task>.from(taskList.tasks);
        final idx = tasks.indexWhere((element) => element.id == e.task.id);
        if (idx >= 0) {
          tasks.removeAt(idx);
          final flutterLocalNotificationsPlugin =
              FlutterLocalNotificationsPlugin();
          flutterLocalNotificationsPlugin.cancel(e.task.id);
          final orderTasks = tasks
              .mapIndexed((index, element) => element.copyWith(order: index))
              .toList();
          tasksBox.put(taskList.id, orderTasks);
        }
      },
      deleteCompletedTasks: (e) async* {
        final activeTaskList = state.activeTaskList!;
        final tasks = List<Task>.from(activeTaskList.tasks);
        tasks.removeWhere((element) => element.completed);
        tasksBox.put(activeTaskList.id, tasks);
      },
      completedTask: (e) async* {
        _toggleCompletedTask(
          taskListId: e.taskListId,
          task: e.task,
          completed: true,
        );
      },
      incompletedTask: (e) async* {
        _toggleCompletedTask(
          taskListId: e.taskListId,
          task: e.task,
          completed: false,
        );
      },
      completedSubTask: (e) async* {
        _toggleCompletedSubTask(
          task: e.task,
          subTask: e.subTask,
          completed: true,
        );
      },
      incompletedSubTask: (e) async* {
        _toggleCompletedSubTask(
          task: e.task,
          subTask: e.subTask,
          completed: false,
        );
      },
      createTaskList: (e) async* {
        final taskList = Tlist(
          id: DateTime.now().toIso8601String(),
          name: e.name,
        );
        taskListsBox.add(taskList);
        add(HomeEvent.updateActiveTaskList(taskList));
      },
      renameTaskList: (e) async* {
        final idx = taskListsBox.values
            .toList()
            .indexWhere((element) => element.id == e.taskList.id);
        if (idx >= 0) {
          taskListsBox.putAt(idx, e.taskList);
          add(HomeEvent.updateActiveTaskList(e.taskList));
        }
      },
      removeTaskList: (e) async* {
        final taskLists = taskListsBox.values.toList().cast<Tlist>();
        final idx = taskLists
            .indexWhere((element) => element.id == state.activeTaskList!.id);

        if (idx > 0 && taskLists.length > 1) {
          final activeTaskListId = state.activeTaskList!.id;
          add(HomeEvent.updateActiveTaskList(taskLists[idx - 1]));
          taskListsBox.deleteAt(idx);
          Hive.box('tasks').delete(activeTaskListId);
        }
      },
      sortBy: (e) async* {
        final taskLists = taskListsBox.values.toList();
        final idx = taskLists
            .indexWhere((element) => element.id == state.activeTaskList!.id);
        if (idx >= 0) {
          final activeTaskList = taskLists[idx].copyWith(sortBy: e.value);
          taskListsBox.putAt(
            idx,
            activeTaskList,
          );
          add(HomeEvent.updateActiveTaskList(activeTaskList));
        }
      },
      reorder: (e) async* {
        final activeTaskList = state.activeTaskList!;
        final tasks = List<Task>.from(activeTaskList.tasks);
        final task = tasks.firstWhere((element) => element.order == e.previous);
        tasks.removeAt(e.previous);
        tasks.insert(e.current < e.previous ? e.current : e.current - 1, task);
        final orderTasks = tasks
            .mapIndexed((index, element) => element.copyWith(order: index))
            .toList();
        tasksBox.put(activeTaskList.id, orderTasks);
      },
    );
  }

  Tlist _getTaskList({
    String? taskListId,
    required Tlist taskList,
  }) {
    if (taskListId != null && taskListId != taskList.id) {
      taskList =
          state.taskLists.firstWhere((element) => element.id == taskListId);
      taskList = taskList.copyWith(
        tasks:
            (tasksBox.get(taskListId, defaultValue: []) as List).cast<Task>(),
      );
    }
    return taskList;
  }

  void _toggleCompletedTask({
    String? taskListId,
    required Task task,
    required bool completed,
  }) {
    final taskList = _getTaskList(
      taskListId: taskListId,
      taskList: state.activeTaskList!,
    );
    final tasks = List<Task>.from(taskList.tasks);
    final idx = tasks.indexWhere((element) => element.id == task.id);
    if (idx >= 0) {
      tasks[idx] = task.copyWith(
        completed: completed,
        subtasks:
            task.subtasks.map((e) => e.copyWith(completed: completed)).toList(),
      );
      tasksBox.put(taskList.id, tasks);
    }
  }

  void _toggleCompletedSubTask({
    required Task task,
    required SubTask subTask,
    required bool completed,
  }) {
    final activeTaskList = state.activeTaskList!;
    final tasks = List<Task>.from(activeTaskList.tasks);
    final idx = tasks.indexWhere((element) => element.id == task.id);
    if (idx >= 0) {
      final subTasks = List<SubTask>.from(activeTaskList.tasks[idx].subtasks);
      final subTasksIdx =
          subTasks.indexWhere((element) => element.id == subTask.id);
      if (subTasksIdx >= 0) {
        subTasks[subTasksIdx] =
            subTasks[subTasksIdx].copyWith(completed: completed);
        tasks[idx] = task.copyWith(
          subtasks: subTasks,
          completed: (task.completed && !completed) ? false : task.completed,
        );
        tasksBox.put(activeTaskList.id, tasks);
      }
    }
  }

  List<Task> sortTasks(Tlist taskList, List<Task> tasks) {
    if (taskList.sortBy == SortBy.MyOrder) {
      tasks.sort((first, second) => first.order.compareTo(second.order));
      return tasks;
    }
    final tasksWithDate =
        tasks.where((element) => element.dateTime != null).toList();
    final tasksWithNoDate =
        tasks.where((element) => element.dateTime == null).toList();
    tasksWithDate.sort((a, b) => a.dateTime!.compareTo(b.dateTime!));
    tasksWithNoDate.sort((a, b) => a.order.compareTo(b.order));
    tasksWithDate.addAll(tasksWithNoDate);
    return tasksWithDate;
  }

  void _scheduleTaskNotification(Task task) {
    if (task.dateTime != null) {
      final dateTime = (task.timeOfDay != null)
          ? DateTime(
              task.dateTime!.year,
              task.dateTime!.month,
              task.dateTime!.day,
              task.timeOfDay!.hour,
              task.timeOfDay!.minute,
            )
          : task.dateTime!;
      scheduleNotification(
        id: task.id,
        title: task.name,
        body: task.details,
        dateTime: dateTime,
      );
    }
  }
}
