import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:tasks/models/sub_task.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial());

  StreamSubscription? _activeTaskListSubscription;
  StreamSubscription? _taskListsSubscription;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {
        Hive.registerAdapter(TlistAdapter());
        Hive.registerAdapter(TaskAdapter());
        Hive.registerAdapter(SubTaskAdapter());

        final taskListsBox = await Hive.openBox<Tlist>('taskLists');
        final tasksBox = await Hive.openBox('tasks');
        // tasksBox.clear();
        if (taskListsBox.isEmpty) {
          taskListsBox.add(Tlist(
            id: DateTime.now().toIso8601String(),
            name: 'My Tasks',
          ));
        }
        final taskLists = taskListsBox.values.toList();
        debugPrint('taskLists $taskLists');
        final tasks = (tasksBox.get(taskLists[0].id, defaultValue: []) as List)
            .cast<Task>();
        debugPrint('tasks $tasks');
        final activeTaskList = taskLists[0].copyWith(tasks: tasks);
        add(HomeEvent.updateTaskLists(taskLists));
        add(HomeEvent.updateActiveTaskList(activeTaskList));

        debugPrint(taskListsBox.values.toString());
        _taskListsSubscription?.cancel();
        _taskListsSubscription = taskListsBox.watch().listen((_) {
          debugPrint('taskListsBox listenable');
          final taskLists = taskListsBox.values.toList();
          add(HomeEvent.updateTaskLists(taskLists));
        });
      },
      updateTaskLists: (e) async* {
        yield state.copyWith(taskLists: e.taskLists);
      },
      updateActiveTaskList: (e) async* {
        yield state.copyWith(activeTaskList: e.taskList);
        final tasksBox = Hive.box('tasks');
        _activeTaskListSubscription?.cancel();
        _activeTaskListSubscription =
            tasksBox.watch(key: e.taskList.id).listen((_) {
          debugPrint('tasksBox');
          final tasks = (tasksBox.get(e.taskList.id, defaultValue: []) as List)
              .cast<Task>();
          add(HomeEvent.updateActiveTaskList(
              e.taskList.copyWith(tasks: tasks)));
        });
      },
      addTask: (e) async* {
        final tasksBox = Hive.box('tasks');
        final activeTaskList = state.activeTaskList!;
        final tasks = List<Task>.from(activeTaskList.tasks);
        tasks.add(e.task);
        tasksBox.put(activeTaskList.id, tasks);
      },
      updateTask: (e) async* {
        final tasksBox = Hive.box('tasks');
        final activeTaskList = state.activeTaskList!;
        final tasks = List<Task>.from(activeTaskList.tasks);
        final idx = tasks.indexWhere((element) => element.id == e.task.id);
        if (idx >= 0) {
          tasks[idx] = e.task;
          tasksBox.put(activeTaskList.id, tasks);
        }
      },
      deleteTask: (e) async* {
        final tasksBox = Hive.box('tasks');
        final activeTaskList = state.activeTaskList!;
        final tasks = List<Task>.from(activeTaskList.tasks);
        final idx = tasks.indexWhere((element) => element.id == e.task.id);
        if (idx >= 0) {
          tasks.removeAt(idx);
          tasksBox.put(activeTaskList.id, tasks);
        }
      },
      completedTask: (e) async* {
        _toggleCompletedTask(task: e.task, completed: true);
      },
      incompletedTask: (e) async* {
        _toggleCompletedTask(task: e.task, completed: false);
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
    );
  }

  void _toggleCompletedTask({
    required Task task,
    required bool completed,
  }) {
    final tasksBox = Hive.box('tasks');
    final activeTaskList = state.activeTaskList!;
    final tasks = List<Task>.from(activeTaskList.tasks);
    final idx = tasks.indexWhere((element) => element.id == task.id);
    if (idx >= 0) {
      tasks[idx] = task.copyWith(
        completed: completed,
        subtasks:
            task.subtasks.map((e) => e.copyWith(completed: completed)).toList(),
      );
      tasksBox.put(activeTaskList.id, tasks);
    }
  }

  void _toggleCompletedSubTask({
    required Task task,
    required SubTask subTask,
    required bool completed,
  }) {
    final tasksBox = Hive.box('tasks');
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
        tasks[idx] = task.copyWith(subtasks: subTasks);
        tasksBox.put(activeTaskList.id, tasks);
      }
    }
  }
}
