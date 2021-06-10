import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
      started: (e) async* {},
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
      onDateChanged: (e) async* {
        yield state.copyWith.task(dateTime: e.value);
      },
      onTaskListChanged: (e) async* {},
      onSubtaskCompleted: (e) async* {
        final subtasks = List<SubTask>.from(state.task.subtasks);
        subtasks[e.index] =
            subtasks[e.index].copyWith(completed: !subtasks[e.index].completed);
        yield state.copyWith.task(subtasks: subtasks);
      },
    );
  }
}
