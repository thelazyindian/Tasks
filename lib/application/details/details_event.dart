part of 'details_bloc.dart';

@freezed
class DetailsEvent with _$DetailsEvent {
  const factory DetailsEvent.onNameChanged(String value) = _OnNameChanged;
  const factory DetailsEvent.onDetailsChanged(String value) = _OnDetailsChanged;
  const factory DetailsEvent.onSubtaskAdded() = _OnSubtaskAdded;
  const factory DetailsEvent.onSubtaskRemoved(int index) = _OnSubtaskRemoved;
  const factory DetailsEvent.onSubtaskCompleted(int index) =
      _OnSubtaskCompleted;
  const factory DetailsEvent.onSubtaskUpdated(int index, String value) =
      _OnSubtaskUpdated;
  const factory DetailsEvent.onDateTimeChanged(
    DateTime? date,
    TimeOfDay? time,
  ) = _OnDateTimeChanged;
  const factory DetailsEvent.onTaskListChanged(String taskListId) =
      _OnTaskListChanged;
}
