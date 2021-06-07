// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeEventTearOff {
  const _$HomeEventTearOff();

  _Started started() {
    return const _Started();
  }

  _UpdateTaskLists updateTaskLists(List<Tlist> taskLists) {
    return _UpdateTaskLists(
      taskLists,
    );
  }

  _UpdateActiveTaskList updateActiveTaskList(Tlist taskList) {
    return _UpdateActiveTaskList(
      taskList,
    );
  }

  _AddTask addTask(Task task) {
    return _AddTask(
      task,
    );
  }

  _UpdateTask updateTask(Task task) {
    return _UpdateTask(
      task,
    );
  }

  _DeleteTask deleteTask(Task task) {
    return _DeleteTask(
      task,
    );
  }
}

/// @nodoc
const $HomeEvent = _$HomeEventTearOff();

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Tlist> taskLists) updateTaskLists,
    required TResult Function(Tlist taskList) updateActiveTaskList,
    required TResult Function(Task task) addTask,
    required TResult Function(Task task) updateTask,
    required TResult Function(Task task) deleteTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Tlist> taskLists)? updateTaskLists,
    TResult Function(Tlist taskList)? updateActiveTaskList,
    TResult Function(Task task)? addTask,
    TResult Function(Task task)? updateTask,
    TResult Function(Task task)? deleteTask,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateTaskLists value) updateTaskLists,
    required TResult Function(_UpdateActiveTaskList value) updateActiveTaskList,
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateTaskLists value)? updateTaskLists,
    TResult Function(_UpdateActiveTaskList value)? updateActiveTaskList,
    TResult Function(_AddTask value)? addTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  final HomeEvent _value;
  // ignore: unused_field
  final $Res Function(HomeEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;
}

/// @nodoc

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'HomeEvent.started'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Tlist> taskLists) updateTaskLists,
    required TResult Function(Tlist taskList) updateActiveTaskList,
    required TResult Function(Task task) addTask,
    required TResult Function(Task task) updateTask,
    required TResult Function(Task task) deleteTask,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Tlist> taskLists)? updateTaskLists,
    TResult Function(Tlist taskList)? updateActiveTaskList,
    TResult Function(Task task)? addTask,
    TResult Function(Task task)? updateTask,
    TResult Function(Task task)? deleteTask,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateTaskLists value) updateTaskLists,
    required TResult Function(_UpdateActiveTaskList value) updateActiveTaskList,
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateTaskLists value)? updateTaskLists,
    TResult Function(_UpdateActiveTaskList value)? updateActiveTaskList,
    TResult Function(_AddTask value)? addTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements HomeEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$UpdateTaskListsCopyWith<$Res> {
  factory _$UpdateTaskListsCopyWith(
          _UpdateTaskLists value, $Res Function(_UpdateTaskLists) then) =
      __$UpdateTaskListsCopyWithImpl<$Res>;
  $Res call({List<Tlist> taskLists});
}

/// @nodoc
class __$UpdateTaskListsCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements _$UpdateTaskListsCopyWith<$Res> {
  __$UpdateTaskListsCopyWithImpl(
      _UpdateTaskLists _value, $Res Function(_UpdateTaskLists) _then)
      : super(_value, (v) => _then(v as _UpdateTaskLists));

  @override
  _UpdateTaskLists get _value => super._value as _UpdateTaskLists;

  @override
  $Res call({
    Object? taskLists = freezed,
  }) {
    return _then(_UpdateTaskLists(
      taskLists == freezed
          ? _value.taskLists
          : taskLists // ignore: cast_nullable_to_non_nullable
              as List<Tlist>,
    ));
  }
}

/// @nodoc

class _$_UpdateTaskLists
    with DiagnosticableTreeMixin
    implements _UpdateTaskLists {
  const _$_UpdateTaskLists(this.taskLists);

  @override
  final List<Tlist> taskLists;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeEvent.updateTaskLists(taskLists: $taskLists)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeEvent.updateTaskLists'))
      ..add(DiagnosticsProperty('taskLists', taskLists));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateTaskLists &&
            (identical(other.taskLists, taskLists) ||
                const DeepCollectionEquality()
                    .equals(other.taskLists, taskLists)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(taskLists);

  @JsonKey(ignore: true)
  @override
  _$UpdateTaskListsCopyWith<_UpdateTaskLists> get copyWith =>
      __$UpdateTaskListsCopyWithImpl<_UpdateTaskLists>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Tlist> taskLists) updateTaskLists,
    required TResult Function(Tlist taskList) updateActiveTaskList,
    required TResult Function(Task task) addTask,
    required TResult Function(Task task) updateTask,
    required TResult Function(Task task) deleteTask,
  }) {
    return updateTaskLists(taskLists);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Tlist> taskLists)? updateTaskLists,
    TResult Function(Tlist taskList)? updateActiveTaskList,
    TResult Function(Task task)? addTask,
    TResult Function(Task task)? updateTask,
    TResult Function(Task task)? deleteTask,
    required TResult orElse(),
  }) {
    if (updateTaskLists != null) {
      return updateTaskLists(taskLists);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateTaskLists value) updateTaskLists,
    required TResult Function(_UpdateActiveTaskList value) updateActiveTaskList,
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
  }) {
    return updateTaskLists(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateTaskLists value)? updateTaskLists,
    TResult Function(_UpdateActiveTaskList value)? updateActiveTaskList,
    TResult Function(_AddTask value)? addTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    required TResult orElse(),
  }) {
    if (updateTaskLists != null) {
      return updateTaskLists(this);
    }
    return orElse();
  }
}

abstract class _UpdateTaskLists implements HomeEvent {
  const factory _UpdateTaskLists(List<Tlist> taskLists) = _$_UpdateTaskLists;

  List<Tlist> get taskLists => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$UpdateTaskListsCopyWith<_UpdateTaskLists> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateActiveTaskListCopyWith<$Res> {
  factory _$UpdateActiveTaskListCopyWith(_UpdateActiveTaskList value,
          $Res Function(_UpdateActiveTaskList) then) =
      __$UpdateActiveTaskListCopyWithImpl<$Res>;
  $Res call({Tlist taskList});

  $TlistCopyWith<$Res> get taskList;
}

/// @nodoc
class __$UpdateActiveTaskListCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res>
    implements _$UpdateActiveTaskListCopyWith<$Res> {
  __$UpdateActiveTaskListCopyWithImpl(
      _UpdateActiveTaskList _value, $Res Function(_UpdateActiveTaskList) _then)
      : super(_value, (v) => _then(v as _UpdateActiveTaskList));

  @override
  _UpdateActiveTaskList get _value => super._value as _UpdateActiveTaskList;

  @override
  $Res call({
    Object? taskList = freezed,
  }) {
    return _then(_UpdateActiveTaskList(
      taskList == freezed
          ? _value.taskList
          : taskList // ignore: cast_nullable_to_non_nullable
              as Tlist,
    ));
  }

  @override
  $TlistCopyWith<$Res> get taskList {
    return $TlistCopyWith<$Res>(_value.taskList, (value) {
      return _then(_value.copyWith(taskList: value));
    });
  }
}

/// @nodoc

class _$_UpdateActiveTaskList
    with DiagnosticableTreeMixin
    implements _UpdateActiveTaskList {
  const _$_UpdateActiveTaskList(this.taskList);

  @override
  final Tlist taskList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeEvent.updateActiveTaskList(taskList: $taskList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeEvent.updateActiveTaskList'))
      ..add(DiagnosticsProperty('taskList', taskList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateActiveTaskList &&
            (identical(other.taskList, taskList) ||
                const DeepCollectionEquality()
                    .equals(other.taskList, taskList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(taskList);

  @JsonKey(ignore: true)
  @override
  _$UpdateActiveTaskListCopyWith<_UpdateActiveTaskList> get copyWith =>
      __$UpdateActiveTaskListCopyWithImpl<_UpdateActiveTaskList>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Tlist> taskLists) updateTaskLists,
    required TResult Function(Tlist taskList) updateActiveTaskList,
    required TResult Function(Task task) addTask,
    required TResult Function(Task task) updateTask,
    required TResult Function(Task task) deleteTask,
  }) {
    return updateActiveTaskList(taskList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Tlist> taskLists)? updateTaskLists,
    TResult Function(Tlist taskList)? updateActiveTaskList,
    TResult Function(Task task)? addTask,
    TResult Function(Task task)? updateTask,
    TResult Function(Task task)? deleteTask,
    required TResult orElse(),
  }) {
    if (updateActiveTaskList != null) {
      return updateActiveTaskList(taskList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateTaskLists value) updateTaskLists,
    required TResult Function(_UpdateActiveTaskList value) updateActiveTaskList,
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
  }) {
    return updateActiveTaskList(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateTaskLists value)? updateTaskLists,
    TResult Function(_UpdateActiveTaskList value)? updateActiveTaskList,
    TResult Function(_AddTask value)? addTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    required TResult orElse(),
  }) {
    if (updateActiveTaskList != null) {
      return updateActiveTaskList(this);
    }
    return orElse();
  }
}

abstract class _UpdateActiveTaskList implements HomeEvent {
  const factory _UpdateActiveTaskList(Tlist taskList) = _$_UpdateActiveTaskList;

  Tlist get taskList => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$UpdateActiveTaskListCopyWith<_UpdateActiveTaskList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AddTaskCopyWith<$Res> {
  factory _$AddTaskCopyWith(_AddTask value, $Res Function(_AddTask) then) =
      __$AddTaskCopyWithImpl<$Res>;
  $Res call({Task task});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$AddTaskCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements _$AddTaskCopyWith<$Res> {
  __$AddTaskCopyWithImpl(_AddTask _value, $Res Function(_AddTask) _then)
      : super(_value, (v) => _then(v as _AddTask));

  @override
  _AddTask get _value => super._value as _AddTask;

  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_AddTask(
      task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }

  @override
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$_AddTask with DiagnosticableTreeMixin implements _AddTask {
  const _$_AddTask(this.task);

  @override
  final Task task;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeEvent.addTask(task: $task)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeEvent.addTask'))
      ..add(DiagnosticsProperty('task', task));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddTask &&
            (identical(other.task, task) ||
                const DeepCollectionEquality().equals(other.task, task)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(task);

  @JsonKey(ignore: true)
  @override
  _$AddTaskCopyWith<_AddTask> get copyWith =>
      __$AddTaskCopyWithImpl<_AddTask>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Tlist> taskLists) updateTaskLists,
    required TResult Function(Tlist taskList) updateActiveTaskList,
    required TResult Function(Task task) addTask,
    required TResult Function(Task task) updateTask,
    required TResult Function(Task task) deleteTask,
  }) {
    return addTask(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Tlist> taskLists)? updateTaskLists,
    TResult Function(Tlist taskList)? updateActiveTaskList,
    TResult Function(Task task)? addTask,
    TResult Function(Task task)? updateTask,
    TResult Function(Task task)? deleteTask,
    required TResult orElse(),
  }) {
    if (addTask != null) {
      return addTask(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateTaskLists value) updateTaskLists,
    required TResult Function(_UpdateActiveTaskList value) updateActiveTaskList,
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
  }) {
    return addTask(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateTaskLists value)? updateTaskLists,
    TResult Function(_UpdateActiveTaskList value)? updateActiveTaskList,
    TResult Function(_AddTask value)? addTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    required TResult orElse(),
  }) {
    if (addTask != null) {
      return addTask(this);
    }
    return orElse();
  }
}

abstract class _AddTask implements HomeEvent {
  const factory _AddTask(Task task) = _$_AddTask;

  Task get task => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$AddTaskCopyWith<_AddTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateTaskCopyWith<$Res> {
  factory _$UpdateTaskCopyWith(
          _UpdateTask value, $Res Function(_UpdateTask) then) =
      __$UpdateTaskCopyWithImpl<$Res>;
  $Res call({Task task});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$UpdateTaskCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements _$UpdateTaskCopyWith<$Res> {
  __$UpdateTaskCopyWithImpl(
      _UpdateTask _value, $Res Function(_UpdateTask) _then)
      : super(_value, (v) => _then(v as _UpdateTask));

  @override
  _UpdateTask get _value => super._value as _UpdateTask;

  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_UpdateTask(
      task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }

  @override
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$_UpdateTask with DiagnosticableTreeMixin implements _UpdateTask {
  const _$_UpdateTask(this.task);

  @override
  final Task task;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeEvent.updateTask(task: $task)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeEvent.updateTask'))
      ..add(DiagnosticsProperty('task', task));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateTask &&
            (identical(other.task, task) ||
                const DeepCollectionEquality().equals(other.task, task)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(task);

  @JsonKey(ignore: true)
  @override
  _$UpdateTaskCopyWith<_UpdateTask> get copyWith =>
      __$UpdateTaskCopyWithImpl<_UpdateTask>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Tlist> taskLists) updateTaskLists,
    required TResult Function(Tlist taskList) updateActiveTaskList,
    required TResult Function(Task task) addTask,
    required TResult Function(Task task) updateTask,
    required TResult Function(Task task) deleteTask,
  }) {
    return updateTask(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Tlist> taskLists)? updateTaskLists,
    TResult Function(Tlist taskList)? updateActiveTaskList,
    TResult Function(Task task)? addTask,
    TResult Function(Task task)? updateTask,
    TResult Function(Task task)? deleteTask,
    required TResult orElse(),
  }) {
    if (updateTask != null) {
      return updateTask(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateTaskLists value) updateTaskLists,
    required TResult Function(_UpdateActiveTaskList value) updateActiveTaskList,
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
  }) {
    return updateTask(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateTaskLists value)? updateTaskLists,
    TResult Function(_UpdateActiveTaskList value)? updateActiveTaskList,
    TResult Function(_AddTask value)? addTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    required TResult orElse(),
  }) {
    if (updateTask != null) {
      return updateTask(this);
    }
    return orElse();
  }
}

abstract class _UpdateTask implements HomeEvent {
  const factory _UpdateTask(Task task) = _$_UpdateTask;

  Task get task => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$UpdateTaskCopyWith<_UpdateTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DeleteTaskCopyWith<$Res> {
  factory _$DeleteTaskCopyWith(
          _DeleteTask value, $Res Function(_DeleteTask) then) =
      __$DeleteTaskCopyWithImpl<$Res>;
  $Res call({Task task});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$DeleteTaskCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements _$DeleteTaskCopyWith<$Res> {
  __$DeleteTaskCopyWithImpl(
      _DeleteTask _value, $Res Function(_DeleteTask) _then)
      : super(_value, (v) => _then(v as _DeleteTask));

  @override
  _DeleteTask get _value => super._value as _DeleteTask;

  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_DeleteTask(
      task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }

  @override
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$_DeleteTask with DiagnosticableTreeMixin implements _DeleteTask {
  const _$_DeleteTask(this.task);

  @override
  final Task task;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeEvent.deleteTask(task: $task)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeEvent.deleteTask'))
      ..add(DiagnosticsProperty('task', task));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeleteTask &&
            (identical(other.task, task) ||
                const DeepCollectionEquality().equals(other.task, task)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(task);

  @JsonKey(ignore: true)
  @override
  _$DeleteTaskCopyWith<_DeleteTask> get copyWith =>
      __$DeleteTaskCopyWithImpl<_DeleteTask>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Tlist> taskLists) updateTaskLists,
    required TResult Function(Tlist taskList) updateActiveTaskList,
    required TResult Function(Task task) addTask,
    required TResult Function(Task task) updateTask,
    required TResult Function(Task task) deleteTask,
  }) {
    return deleteTask(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Tlist> taskLists)? updateTaskLists,
    TResult Function(Tlist taskList)? updateActiveTaskList,
    TResult Function(Task task)? addTask,
    TResult Function(Task task)? updateTask,
    TResult Function(Task task)? deleteTask,
    required TResult orElse(),
  }) {
    if (deleteTask != null) {
      return deleteTask(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateTaskLists value) updateTaskLists,
    required TResult Function(_UpdateActiveTaskList value) updateActiveTaskList,
    required TResult Function(_AddTask value) addTask,
    required TResult Function(_UpdateTask value) updateTask,
    required TResult Function(_DeleteTask value) deleteTask,
  }) {
    return deleteTask(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateTaskLists value)? updateTaskLists,
    TResult Function(_UpdateActiveTaskList value)? updateActiveTaskList,
    TResult Function(_AddTask value)? addTask,
    TResult Function(_UpdateTask value)? updateTask,
    TResult Function(_DeleteTask value)? deleteTask,
    required TResult orElse(),
  }) {
    if (deleteTask != null) {
      return deleteTask(this);
    }
    return orElse();
  }
}

abstract class _DeleteTask implements HomeEvent {
  const factory _DeleteTask(Task task) = _$_DeleteTask;

  Task get task => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$DeleteTaskCopyWith<_DeleteTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call({required List<Tlist> taskLists, Tlist? activeTaskList}) {
    return _HomeState(
      taskLists: taskLists,
      activeTaskList: activeTaskList,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
  List<Tlist> get taskLists => throw _privateConstructorUsedError;
  Tlist? get activeTaskList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call({List<Tlist> taskLists, Tlist? activeTaskList});

  $TlistCopyWith<$Res>? get activeTaskList;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? taskLists = freezed,
    Object? activeTaskList = freezed,
  }) {
    return _then(_value.copyWith(
      taskLists: taskLists == freezed
          ? _value.taskLists
          : taskLists // ignore: cast_nullable_to_non_nullable
              as List<Tlist>,
      activeTaskList: activeTaskList == freezed
          ? _value.activeTaskList
          : activeTaskList // ignore: cast_nullable_to_non_nullable
              as Tlist?,
    ));
  }

  @override
  $TlistCopyWith<$Res>? get activeTaskList {
    if (_value.activeTaskList == null) {
      return null;
    }

    return $TlistCopyWith<$Res>(_value.activeTaskList!, (value) {
      return _then(_value.copyWith(activeTaskList: value));
    });
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Tlist> taskLists, Tlist? activeTaskList});

  @override
  $TlistCopyWith<$Res>? get activeTaskList;
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? taskLists = freezed,
    Object? activeTaskList = freezed,
  }) {
    return _then(_HomeState(
      taskLists: taskLists == freezed
          ? _value.taskLists
          : taskLists // ignore: cast_nullable_to_non_nullable
              as List<Tlist>,
      activeTaskList: activeTaskList == freezed
          ? _value.activeTaskList
          : activeTaskList // ignore: cast_nullable_to_non_nullable
              as Tlist?,
    ));
  }
}

/// @nodoc

class _$_HomeState with DiagnosticableTreeMixin implements _HomeState {
  const _$_HomeState({required this.taskLists, this.activeTaskList});

  @override
  final List<Tlist> taskLists;
  @override
  final Tlist? activeTaskList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState(taskLists: $taskLists, activeTaskList: $activeTaskList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState'))
      ..add(DiagnosticsProperty('taskLists', taskLists))
      ..add(DiagnosticsProperty('activeTaskList', activeTaskList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeState &&
            (identical(other.taskLists, taskLists) ||
                const DeepCollectionEquality()
                    .equals(other.taskLists, taskLists)) &&
            (identical(other.activeTaskList, activeTaskList) ||
                const DeepCollectionEquality()
                    .equals(other.activeTaskList, activeTaskList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(taskLists) ^
      const DeepCollectionEquality().hash(activeTaskList);

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required List<Tlist> taskLists, Tlist? activeTaskList}) = _$_HomeState;

  @override
  List<Tlist> get taskLists => throw _privateConstructorUsedError;
  @override
  Tlist? get activeTaskList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
