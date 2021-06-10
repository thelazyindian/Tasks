part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.updateTaskLists(List<Tlist> taskLists) =
      _UpdateTaskLists;
  const factory HomeEvent.updateActiveTaskList(Tlist taskList) =
      _UpdateActiveTaskList;
  const factory HomeEvent.addTask(Task task) = _AddTask;
  const factory HomeEvent.updateTask(Task task) = _UpdateTask;
  const factory HomeEvent.completedTask(Task task) = _CompletedTask;
  const factory HomeEvent.incompletedTask(Task task) = _IncompletedTask;
  const factory HomeEvent.deleteTask(Task task) = _DeleteTask;
  const factory HomeEvent.completedSubTask(
    Task task,
    SubTask subTask,
  ) = _CompletedSubTask;
  const factory HomeEvent.incompletedSubTask(
    Task task,
    SubTask subTask,
  ) = _IncompletedSubTask;
  const factory HomeEvent.createTaskList(String name) = _CreateTaskList;
  const factory HomeEvent.renameTaskList(Tlist taskList) = _RenameTaskList;
  const factory HomeEvent.removeTaskList(Tlist taskList) = _RemoveTaskList;
}
