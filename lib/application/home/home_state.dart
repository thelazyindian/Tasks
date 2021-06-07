part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<Tlist> taskLists,
    Tlist? activeTaskList,
  }) = _HomeState;

  factory HomeState.initial() => _HomeState(taskLists: []);
}
