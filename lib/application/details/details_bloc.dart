import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:tasks/models/sub_task.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';

part 'details_event.dart';
part 'details_state.dart';
part 'details_bloc.freezed.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(DetailsState initialState) : super(initialState);

  @override
  Stream<DetailsState> mapEventToState(
    DetailsEvent event,
  ) async* {
    yield* event.map(
      onNameChanged: (e) async* {
        yield state.copyWith.task(name: e.value);
      },
      onDetailsChanged: (e) async* {
        yield state.copyWith.task(details: e.value);
      },
      onSubtaskAdded: (e) async* {
        final subtasks = List<SubTask>.from(state.task.subtasks);
        subtasks.add(SubTask(id: DateTime.now().toIso8601String()));
        yield state.copyWith.task(subtasks: subtasks);
      },
      onSubtaskRemoved: (e) async* {
        final subtasks = List<SubTask>.from(state.task.subtasks);
        subtasks.removeAt(e.index);
        yield state.copyWith.task(subtasks: subtasks);
      },
      onSubtaskUpdated: (e) async* {
        final subtasks = List<SubTask>.from(state.task.subtasks);
        subtasks[e.index] = subtasks[e.index].copyWith(name: e.value);
        yield state.copyWith.task(subtasks: subtasks);
      },
      onDateTimeChanged: (e) async* {
        yield state.copyWith.task(
          dateTime: e.date,
          timeOfDay: e.time,
        );
      },
      onTaskListChanged: (e) async* {
        final tasksBox = Hive.box('tasks');
        final fromTasks = List.from(
                tasksBox.get(state.activeTaskList.id, defaultValue: []) as List)
            .cast<Task>();
        fromTasks.removeWhere((element) => element.id == state.task.id);
        tasksBox.put(state.activeTaskList.id, fromTasks);
        final toTasks =
            List.from(tasksBox.get(e.taskListId, defaultValue: []) as List)
                .cast<Task>();
        toTasks.add(state.task);
        tasksBox.put(e.taskListId, toTasks);
        final idx =
            state.taskLists.indexWhere((element) => element.id == e.taskListId);
        yield state.copyWith(activeTaskList: state.taskLists[idx]);
      },
      onSubtaskCompleted: (e) async* {
        final subtasks = List<SubTask>.from(state.task.subtasks);
        subtasks[e.index] =
            subtasks[e.index].copyWith(completed: !subtasks[e.index].completed);
        yield state.copyWith.task(subtasks: subtasks);
      },
    );
  }
}
