part of 'details_bloc.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState({
    required List<Tlist> taskLists,
    required Tlist activeTaskList,
    required Task task,
  }) = _DetailsState;

  factory DetailsState.initial() => _DetailsState(
        taskLists: [],
        activeTaskList: Tlist.initial(),
        task: Task.initial(),
      );
}
