// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DetailsEventTearOff {
  const _$DetailsEventTearOff();

  _Started started(
      {required List<Tlist> taskLists,
      required Tlist activeTaskList,
      required Task task}) {
    return _Started(
      taskLists: taskLists,
      activeTaskList: activeTaskList,
      task: task,
    );
  }

  _OnNameChanged onNameChanged(String value) {
    return _OnNameChanged(
      value,
    );
  }

  _OnDetailsChanged onDetailsChanged(String value) {
    return _OnDetailsChanged(
      value,
    );
  }

  _OnSubtaskAdded onSubtaskAdded() {
    return const _OnSubtaskAdded();
  }

  _OnSubtaskRemoved onSubtaskRemoved(int index) {
    return _OnSubtaskRemoved(
      index,
    );
  }

  _OnSubtaskCompleted onSubtaskCompleted(int index) {
    return _OnSubtaskCompleted(
      index,
    );
  }

  _OnSubtaskUpdated onSubtaskUpdated(int index, String value) {
    return _OnSubtaskUpdated(
      index,
      value,
    );
  }

  _OnDateChanged onDateChanged(DateTime? value) {
    return _OnDateChanged(
      value,
    );
  }

  _OnTaskListChanged onTaskListChanged(Tlist taskList) {
    return _OnTaskListChanged(
      taskList,
    );
  }
}

/// @nodoc
const $DetailsEvent = _$DetailsEventTearOff();

/// @nodoc
mixin _$DetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Tlist> taskLists, Tlist activeTaskList, Task task)
        started,
    required TResult Function(String value) onNameChanged,
    required TResult Function(String value) onDetailsChanged,
    required TResult Function() onSubtaskAdded,
    required TResult Function(int index) onSubtaskRemoved,
    required TResult Function(int index) onSubtaskCompleted,
    required TResult Function(int index, String value) onSubtaskUpdated,
    required TResult Function(DateTime? value) onDateChanged,
    required TResult Function(Tlist taskList) onTaskListChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Tlist> taskLists, Tlist activeTaskList, Task task)?
        started,
    TResult Function(String value)? onNameChanged,
    TResult Function(String value)? onDetailsChanged,
    TResult Function()? onSubtaskAdded,
    TResult Function(int index)? onSubtaskRemoved,
    TResult Function(int index)? onSubtaskCompleted,
    TResult Function(int index, String value)? onSubtaskUpdated,
    TResult Function(DateTime? value)? onDateChanged,
    TResult Function(Tlist taskList)? onTaskListChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnNameChanged value) onNameChanged,
    required TResult Function(_OnDetailsChanged value) onDetailsChanged,
    required TResult Function(_OnSubtaskAdded value) onSubtaskAdded,
    required TResult Function(_OnSubtaskRemoved value) onSubtaskRemoved,
    required TResult Function(_OnSubtaskCompleted value) onSubtaskCompleted,
    required TResult Function(_OnSubtaskUpdated value) onSubtaskUpdated,
    required TResult Function(_OnDateChanged value) onDateChanged,
    required TResult Function(_OnTaskListChanged value) onTaskListChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnNameChanged value)? onNameChanged,
    TResult Function(_OnDetailsChanged value)? onDetailsChanged,
    TResult Function(_OnSubtaskAdded value)? onSubtaskAdded,
    TResult Function(_OnSubtaskRemoved value)? onSubtaskRemoved,
    TResult Function(_OnSubtaskCompleted value)? onSubtaskCompleted,
    TResult Function(_OnSubtaskUpdated value)? onSubtaskUpdated,
    TResult Function(_OnDateChanged value)? onDateChanged,
    TResult Function(_OnTaskListChanged value)? onTaskListChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsEventCopyWith<$Res> {
  factory $DetailsEventCopyWith(
          DetailsEvent value, $Res Function(DetailsEvent) then) =
      _$DetailsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DetailsEventCopyWithImpl<$Res> implements $DetailsEventCopyWith<$Res> {
  _$DetailsEventCopyWithImpl(this._value, this._then);

  final DetailsEvent _value;
  // ignore: unused_field
  final $Res Function(DetailsEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
  $Res call({List<Tlist> taskLists, Tlist activeTaskList, Task task});

  $TlistCopyWith<$Res> get activeTaskList;
  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> extends _$DetailsEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;

  @override
  $Res call({
    Object? taskLists = freezed,
    Object? activeTaskList = freezed,
    Object? task = freezed,
  }) {
    return _then(_Started(
      taskLists: taskLists == freezed
          ? _value.taskLists
          : taskLists // ignore: cast_nullable_to_non_nullable
              as List<Tlist>,
      activeTaskList: activeTaskList == freezed
          ? _value.activeTaskList
          : activeTaskList // ignore: cast_nullable_to_non_nullable
              as Tlist,
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }

  @override
  $TlistCopyWith<$Res> get activeTaskList {
    return $TlistCopyWith<$Res>(_value.activeTaskList, (value) {
      return _then(_value.copyWith(activeTaskList: value));
    });
  }

  @override
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started(
      {required this.taskLists,
      required this.activeTaskList,
      required this.task});

  @override
  final List<Tlist> taskLists;
  @override
  final Tlist activeTaskList;
  @override
  final Task task;

  @override
  String toString() {
    return 'DetailsEvent.started(taskLists: $taskLists, activeTaskList: $activeTaskList, task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Started &&
            (identical(other.taskLists, taskLists) ||
                const DeepCollectionEquality()
                    .equals(other.taskLists, taskLists)) &&
            (identical(other.activeTaskList, activeTaskList) ||
                const DeepCollectionEquality()
                    .equals(other.activeTaskList, activeTaskList)) &&
            (identical(other.task, task) ||
                const DeepCollectionEquality().equals(other.task, task)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(taskLists) ^
      const DeepCollectionEquality().hash(activeTaskList) ^
      const DeepCollectionEquality().hash(task);

  @JsonKey(ignore: true)
  @override
  _$StartedCopyWith<_Started> get copyWith =>
      __$StartedCopyWithImpl<_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Tlist> taskLists, Tlist activeTaskList, Task task)
        started,
    required TResult Function(String value) onNameChanged,
    required TResult Function(String value) onDetailsChanged,
    required TResult Function() onSubtaskAdded,
    required TResult Function(int index) onSubtaskRemoved,
    required TResult Function(int index) onSubtaskCompleted,
    required TResult Function(int index, String value) onSubtaskUpdated,
    required TResult Function(DateTime? value) onDateChanged,
    required TResult Function(Tlist taskList) onTaskListChanged,
  }) {
    return started(taskLists, activeTaskList, task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Tlist> taskLists, Tlist activeTaskList, Task task)?
        started,
    TResult Function(String value)? onNameChanged,
    TResult Function(String value)? onDetailsChanged,
    TResult Function()? onSubtaskAdded,
    TResult Function(int index)? onSubtaskRemoved,
    TResult Function(int index)? onSubtaskCompleted,
    TResult Function(int index, String value)? onSubtaskUpdated,
    TResult Function(DateTime? value)? onDateChanged,
    TResult Function(Tlist taskList)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(taskLists, activeTaskList, task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnNameChanged value) onNameChanged,
    required TResult Function(_OnDetailsChanged value) onDetailsChanged,
    required TResult Function(_OnSubtaskAdded value) onSubtaskAdded,
    required TResult Function(_OnSubtaskRemoved value) onSubtaskRemoved,
    required TResult Function(_OnSubtaskCompleted value) onSubtaskCompleted,
    required TResult Function(_OnSubtaskUpdated value) onSubtaskUpdated,
    required TResult Function(_OnDateChanged value) onDateChanged,
    required TResult Function(_OnTaskListChanged value) onTaskListChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnNameChanged value)? onNameChanged,
    TResult Function(_OnDetailsChanged value)? onDetailsChanged,
    TResult Function(_OnSubtaskAdded value)? onSubtaskAdded,
    TResult Function(_OnSubtaskRemoved value)? onSubtaskRemoved,
    TResult Function(_OnSubtaskCompleted value)? onSubtaskCompleted,
    TResult Function(_OnSubtaskUpdated value)? onSubtaskUpdated,
    TResult Function(_OnDateChanged value)? onDateChanged,
    TResult Function(_OnTaskListChanged value)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements DetailsEvent {
  const factory _Started(
      {required List<Tlist> taskLists,
      required Tlist activeTaskList,
      required Task task}) = _$_Started;

  List<Tlist> get taskLists => throw _privateConstructorUsedError;
  Tlist get activeTaskList => throw _privateConstructorUsedError;
  Task get task => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$StartedCopyWith<_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnNameChangedCopyWith<$Res> {
  factory _$OnNameChangedCopyWith(
          _OnNameChanged value, $Res Function(_OnNameChanged) then) =
      __$OnNameChangedCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class __$OnNameChangedCopyWithImpl<$Res>
    extends _$DetailsEventCopyWithImpl<$Res>
    implements _$OnNameChangedCopyWith<$Res> {
  __$OnNameChangedCopyWithImpl(
      _OnNameChanged _value, $Res Function(_OnNameChanged) _then)
      : super(_value, (v) => _then(v as _OnNameChanged));

  @override
  _OnNameChanged get _value => super._value as _OnNameChanged;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_OnNameChanged(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnNameChanged implements _OnNameChanged {
  const _$_OnNameChanged(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'DetailsEvent.onNameChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnNameChanged &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$OnNameChangedCopyWith<_OnNameChanged> get copyWith =>
      __$OnNameChangedCopyWithImpl<_OnNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Tlist> taskLists, Tlist activeTaskList, Task task)
        started,
    required TResult Function(String value) onNameChanged,
    required TResult Function(String value) onDetailsChanged,
    required TResult Function() onSubtaskAdded,
    required TResult Function(int index) onSubtaskRemoved,
    required TResult Function(int index) onSubtaskCompleted,
    required TResult Function(int index, String value) onSubtaskUpdated,
    required TResult Function(DateTime? value) onDateChanged,
    required TResult Function(Tlist taskList) onTaskListChanged,
  }) {
    return onNameChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Tlist> taskLists, Tlist activeTaskList, Task task)?
        started,
    TResult Function(String value)? onNameChanged,
    TResult Function(String value)? onDetailsChanged,
    TResult Function()? onSubtaskAdded,
    TResult Function(int index)? onSubtaskRemoved,
    TResult Function(int index)? onSubtaskCompleted,
    TResult Function(int index, String value)? onSubtaskUpdated,
    TResult Function(DateTime? value)? onDateChanged,
    TResult Function(Tlist taskList)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onNameChanged != null) {
      return onNameChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnNameChanged value) onNameChanged,
    required TResult Function(_OnDetailsChanged value) onDetailsChanged,
    required TResult Function(_OnSubtaskAdded value) onSubtaskAdded,
    required TResult Function(_OnSubtaskRemoved value) onSubtaskRemoved,
    required TResult Function(_OnSubtaskCompleted value) onSubtaskCompleted,
    required TResult Function(_OnSubtaskUpdated value) onSubtaskUpdated,
    required TResult Function(_OnDateChanged value) onDateChanged,
    required TResult Function(_OnTaskListChanged value) onTaskListChanged,
  }) {
    return onNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnNameChanged value)? onNameChanged,
    TResult Function(_OnDetailsChanged value)? onDetailsChanged,
    TResult Function(_OnSubtaskAdded value)? onSubtaskAdded,
    TResult Function(_OnSubtaskRemoved value)? onSubtaskRemoved,
    TResult Function(_OnSubtaskCompleted value)? onSubtaskCompleted,
    TResult Function(_OnSubtaskUpdated value)? onSubtaskUpdated,
    TResult Function(_OnDateChanged value)? onDateChanged,
    TResult Function(_OnTaskListChanged value)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onNameChanged != null) {
      return onNameChanged(this);
    }
    return orElse();
  }
}

abstract class _OnNameChanged implements DetailsEvent {
  const factory _OnNameChanged(String value) = _$_OnNameChanged;

  String get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$OnNameChangedCopyWith<_OnNameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnDetailsChangedCopyWith<$Res> {
  factory _$OnDetailsChangedCopyWith(
          _OnDetailsChanged value, $Res Function(_OnDetailsChanged) then) =
      __$OnDetailsChangedCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class __$OnDetailsChangedCopyWithImpl<$Res>
    extends _$DetailsEventCopyWithImpl<$Res>
    implements _$OnDetailsChangedCopyWith<$Res> {
  __$OnDetailsChangedCopyWithImpl(
      _OnDetailsChanged _value, $Res Function(_OnDetailsChanged) _then)
      : super(_value, (v) => _then(v as _OnDetailsChanged));

  @override
  _OnDetailsChanged get _value => super._value as _OnDetailsChanged;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_OnDetailsChanged(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnDetailsChanged implements _OnDetailsChanged {
  const _$_OnDetailsChanged(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'DetailsEvent.onDetailsChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnDetailsChanged &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$OnDetailsChangedCopyWith<_OnDetailsChanged> get copyWith =>
      __$OnDetailsChangedCopyWithImpl<_OnDetailsChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Tlist> taskLists, Tlist activeTaskList, Task task)
        started,
    required TResult Function(String value) onNameChanged,
    required TResult Function(String value) onDetailsChanged,
    required TResult Function() onSubtaskAdded,
    required TResult Function(int index) onSubtaskRemoved,
    required TResult Function(int index) onSubtaskCompleted,
    required TResult Function(int index, String value) onSubtaskUpdated,
    required TResult Function(DateTime? value) onDateChanged,
    required TResult Function(Tlist taskList) onTaskListChanged,
  }) {
    return onDetailsChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Tlist> taskLists, Tlist activeTaskList, Task task)?
        started,
    TResult Function(String value)? onNameChanged,
    TResult Function(String value)? onDetailsChanged,
    TResult Function()? onSubtaskAdded,
    TResult Function(int index)? onSubtaskRemoved,
    TResult Function(int index)? onSubtaskCompleted,
    TResult Function(int index, String value)? onSubtaskUpdated,
    TResult Function(DateTime? value)? onDateChanged,
    TResult Function(Tlist taskList)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onDetailsChanged != null) {
      return onDetailsChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnNameChanged value) onNameChanged,
    required TResult Function(_OnDetailsChanged value) onDetailsChanged,
    required TResult Function(_OnSubtaskAdded value) onSubtaskAdded,
    required TResult Function(_OnSubtaskRemoved value) onSubtaskRemoved,
    required TResult Function(_OnSubtaskCompleted value) onSubtaskCompleted,
    required TResult Function(_OnSubtaskUpdated value) onSubtaskUpdated,
    required TResult Function(_OnDateChanged value) onDateChanged,
    required TResult Function(_OnTaskListChanged value) onTaskListChanged,
  }) {
    return onDetailsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnNameChanged value)? onNameChanged,
    TResult Function(_OnDetailsChanged value)? onDetailsChanged,
    TResult Function(_OnSubtaskAdded value)? onSubtaskAdded,
    TResult Function(_OnSubtaskRemoved value)? onSubtaskRemoved,
    TResult Function(_OnSubtaskCompleted value)? onSubtaskCompleted,
    TResult Function(_OnSubtaskUpdated value)? onSubtaskUpdated,
    TResult Function(_OnDateChanged value)? onDateChanged,
    TResult Function(_OnTaskListChanged value)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onDetailsChanged != null) {
      return onDetailsChanged(this);
    }
    return orElse();
  }
}

abstract class _OnDetailsChanged implements DetailsEvent {
  const factory _OnDetailsChanged(String value) = _$_OnDetailsChanged;

  String get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$OnDetailsChangedCopyWith<_OnDetailsChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnSubtaskAddedCopyWith<$Res> {
  factory _$OnSubtaskAddedCopyWith(
          _OnSubtaskAdded value, $Res Function(_OnSubtaskAdded) then) =
      __$OnSubtaskAddedCopyWithImpl<$Res>;
}

/// @nodoc
class __$OnSubtaskAddedCopyWithImpl<$Res>
    extends _$DetailsEventCopyWithImpl<$Res>
    implements _$OnSubtaskAddedCopyWith<$Res> {
  __$OnSubtaskAddedCopyWithImpl(
      _OnSubtaskAdded _value, $Res Function(_OnSubtaskAdded) _then)
      : super(_value, (v) => _then(v as _OnSubtaskAdded));

  @override
  _OnSubtaskAdded get _value => super._value as _OnSubtaskAdded;
}

/// @nodoc

class _$_OnSubtaskAdded implements _OnSubtaskAdded {
  const _$_OnSubtaskAdded();

  @override
  String toString() {
    return 'DetailsEvent.onSubtaskAdded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _OnSubtaskAdded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Tlist> taskLists, Tlist activeTaskList, Task task)
        started,
    required TResult Function(String value) onNameChanged,
    required TResult Function(String value) onDetailsChanged,
    required TResult Function() onSubtaskAdded,
    required TResult Function(int index) onSubtaskRemoved,
    required TResult Function(int index) onSubtaskCompleted,
    required TResult Function(int index, String value) onSubtaskUpdated,
    required TResult Function(DateTime? value) onDateChanged,
    required TResult Function(Tlist taskList) onTaskListChanged,
  }) {
    return onSubtaskAdded();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Tlist> taskLists, Tlist activeTaskList, Task task)?
        started,
    TResult Function(String value)? onNameChanged,
    TResult Function(String value)? onDetailsChanged,
    TResult Function()? onSubtaskAdded,
    TResult Function(int index)? onSubtaskRemoved,
    TResult Function(int index)? onSubtaskCompleted,
    TResult Function(int index, String value)? onSubtaskUpdated,
    TResult Function(DateTime? value)? onDateChanged,
    TResult Function(Tlist taskList)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onSubtaskAdded != null) {
      return onSubtaskAdded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnNameChanged value) onNameChanged,
    required TResult Function(_OnDetailsChanged value) onDetailsChanged,
    required TResult Function(_OnSubtaskAdded value) onSubtaskAdded,
    required TResult Function(_OnSubtaskRemoved value) onSubtaskRemoved,
    required TResult Function(_OnSubtaskCompleted value) onSubtaskCompleted,
    required TResult Function(_OnSubtaskUpdated value) onSubtaskUpdated,
    required TResult Function(_OnDateChanged value) onDateChanged,
    required TResult Function(_OnTaskListChanged value) onTaskListChanged,
  }) {
    return onSubtaskAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnNameChanged value)? onNameChanged,
    TResult Function(_OnDetailsChanged value)? onDetailsChanged,
    TResult Function(_OnSubtaskAdded value)? onSubtaskAdded,
    TResult Function(_OnSubtaskRemoved value)? onSubtaskRemoved,
    TResult Function(_OnSubtaskCompleted value)? onSubtaskCompleted,
    TResult Function(_OnSubtaskUpdated value)? onSubtaskUpdated,
    TResult Function(_OnDateChanged value)? onDateChanged,
    TResult Function(_OnTaskListChanged value)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onSubtaskAdded != null) {
      return onSubtaskAdded(this);
    }
    return orElse();
  }
}

abstract class _OnSubtaskAdded implements DetailsEvent {
  const factory _OnSubtaskAdded() = _$_OnSubtaskAdded;
}

/// @nodoc
abstract class _$OnSubtaskRemovedCopyWith<$Res> {
  factory _$OnSubtaskRemovedCopyWith(
          _OnSubtaskRemoved value, $Res Function(_OnSubtaskRemoved) then) =
      __$OnSubtaskRemovedCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$OnSubtaskRemovedCopyWithImpl<$Res>
    extends _$DetailsEventCopyWithImpl<$Res>
    implements _$OnSubtaskRemovedCopyWith<$Res> {
  __$OnSubtaskRemovedCopyWithImpl(
      _OnSubtaskRemoved _value, $Res Function(_OnSubtaskRemoved) _then)
      : super(_value, (v) => _then(v as _OnSubtaskRemoved));

  @override
  _OnSubtaskRemoved get _value => super._value as _OnSubtaskRemoved;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_OnSubtaskRemoved(
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_OnSubtaskRemoved implements _OnSubtaskRemoved {
  const _$_OnSubtaskRemoved(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'DetailsEvent.onSubtaskRemoved(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnSubtaskRemoved &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(index);

  @JsonKey(ignore: true)
  @override
  _$OnSubtaskRemovedCopyWith<_OnSubtaskRemoved> get copyWith =>
      __$OnSubtaskRemovedCopyWithImpl<_OnSubtaskRemoved>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Tlist> taskLists, Tlist activeTaskList, Task task)
        started,
    required TResult Function(String value) onNameChanged,
    required TResult Function(String value) onDetailsChanged,
    required TResult Function() onSubtaskAdded,
    required TResult Function(int index) onSubtaskRemoved,
    required TResult Function(int index) onSubtaskCompleted,
    required TResult Function(int index, String value) onSubtaskUpdated,
    required TResult Function(DateTime? value) onDateChanged,
    required TResult Function(Tlist taskList) onTaskListChanged,
  }) {
    return onSubtaskRemoved(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Tlist> taskLists, Tlist activeTaskList, Task task)?
        started,
    TResult Function(String value)? onNameChanged,
    TResult Function(String value)? onDetailsChanged,
    TResult Function()? onSubtaskAdded,
    TResult Function(int index)? onSubtaskRemoved,
    TResult Function(int index)? onSubtaskCompleted,
    TResult Function(int index, String value)? onSubtaskUpdated,
    TResult Function(DateTime? value)? onDateChanged,
    TResult Function(Tlist taskList)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onSubtaskRemoved != null) {
      return onSubtaskRemoved(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnNameChanged value) onNameChanged,
    required TResult Function(_OnDetailsChanged value) onDetailsChanged,
    required TResult Function(_OnSubtaskAdded value) onSubtaskAdded,
    required TResult Function(_OnSubtaskRemoved value) onSubtaskRemoved,
    required TResult Function(_OnSubtaskCompleted value) onSubtaskCompleted,
    required TResult Function(_OnSubtaskUpdated value) onSubtaskUpdated,
    required TResult Function(_OnDateChanged value) onDateChanged,
    required TResult Function(_OnTaskListChanged value) onTaskListChanged,
  }) {
    return onSubtaskRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnNameChanged value)? onNameChanged,
    TResult Function(_OnDetailsChanged value)? onDetailsChanged,
    TResult Function(_OnSubtaskAdded value)? onSubtaskAdded,
    TResult Function(_OnSubtaskRemoved value)? onSubtaskRemoved,
    TResult Function(_OnSubtaskCompleted value)? onSubtaskCompleted,
    TResult Function(_OnSubtaskUpdated value)? onSubtaskUpdated,
    TResult Function(_OnDateChanged value)? onDateChanged,
    TResult Function(_OnTaskListChanged value)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onSubtaskRemoved != null) {
      return onSubtaskRemoved(this);
    }
    return orElse();
  }
}

abstract class _OnSubtaskRemoved implements DetailsEvent {
  const factory _OnSubtaskRemoved(int index) = _$_OnSubtaskRemoved;

  int get index => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$OnSubtaskRemovedCopyWith<_OnSubtaskRemoved> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnSubtaskCompletedCopyWith<$Res> {
  factory _$OnSubtaskCompletedCopyWith(
          _OnSubtaskCompleted value, $Res Function(_OnSubtaskCompleted) then) =
      __$OnSubtaskCompletedCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$OnSubtaskCompletedCopyWithImpl<$Res>
    extends _$DetailsEventCopyWithImpl<$Res>
    implements _$OnSubtaskCompletedCopyWith<$Res> {
  __$OnSubtaskCompletedCopyWithImpl(
      _OnSubtaskCompleted _value, $Res Function(_OnSubtaskCompleted) _then)
      : super(_value, (v) => _then(v as _OnSubtaskCompleted));

  @override
  _OnSubtaskCompleted get _value => super._value as _OnSubtaskCompleted;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_OnSubtaskCompleted(
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_OnSubtaskCompleted implements _OnSubtaskCompleted {
  const _$_OnSubtaskCompleted(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'DetailsEvent.onSubtaskCompleted(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnSubtaskCompleted &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(index);

  @JsonKey(ignore: true)
  @override
  _$OnSubtaskCompletedCopyWith<_OnSubtaskCompleted> get copyWith =>
      __$OnSubtaskCompletedCopyWithImpl<_OnSubtaskCompleted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Tlist> taskLists, Tlist activeTaskList, Task task)
        started,
    required TResult Function(String value) onNameChanged,
    required TResult Function(String value) onDetailsChanged,
    required TResult Function() onSubtaskAdded,
    required TResult Function(int index) onSubtaskRemoved,
    required TResult Function(int index) onSubtaskCompleted,
    required TResult Function(int index, String value) onSubtaskUpdated,
    required TResult Function(DateTime? value) onDateChanged,
    required TResult Function(Tlist taskList) onTaskListChanged,
  }) {
    return onSubtaskCompleted(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Tlist> taskLists, Tlist activeTaskList, Task task)?
        started,
    TResult Function(String value)? onNameChanged,
    TResult Function(String value)? onDetailsChanged,
    TResult Function()? onSubtaskAdded,
    TResult Function(int index)? onSubtaskRemoved,
    TResult Function(int index)? onSubtaskCompleted,
    TResult Function(int index, String value)? onSubtaskUpdated,
    TResult Function(DateTime? value)? onDateChanged,
    TResult Function(Tlist taskList)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onSubtaskCompleted != null) {
      return onSubtaskCompleted(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnNameChanged value) onNameChanged,
    required TResult Function(_OnDetailsChanged value) onDetailsChanged,
    required TResult Function(_OnSubtaskAdded value) onSubtaskAdded,
    required TResult Function(_OnSubtaskRemoved value) onSubtaskRemoved,
    required TResult Function(_OnSubtaskCompleted value) onSubtaskCompleted,
    required TResult Function(_OnSubtaskUpdated value) onSubtaskUpdated,
    required TResult Function(_OnDateChanged value) onDateChanged,
    required TResult Function(_OnTaskListChanged value) onTaskListChanged,
  }) {
    return onSubtaskCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnNameChanged value)? onNameChanged,
    TResult Function(_OnDetailsChanged value)? onDetailsChanged,
    TResult Function(_OnSubtaskAdded value)? onSubtaskAdded,
    TResult Function(_OnSubtaskRemoved value)? onSubtaskRemoved,
    TResult Function(_OnSubtaskCompleted value)? onSubtaskCompleted,
    TResult Function(_OnSubtaskUpdated value)? onSubtaskUpdated,
    TResult Function(_OnDateChanged value)? onDateChanged,
    TResult Function(_OnTaskListChanged value)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onSubtaskCompleted != null) {
      return onSubtaskCompleted(this);
    }
    return orElse();
  }
}

abstract class _OnSubtaskCompleted implements DetailsEvent {
  const factory _OnSubtaskCompleted(int index) = _$_OnSubtaskCompleted;

  int get index => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$OnSubtaskCompletedCopyWith<_OnSubtaskCompleted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnSubtaskUpdatedCopyWith<$Res> {
  factory _$OnSubtaskUpdatedCopyWith(
          _OnSubtaskUpdated value, $Res Function(_OnSubtaskUpdated) then) =
      __$OnSubtaskUpdatedCopyWithImpl<$Res>;
  $Res call({int index, String value});
}

/// @nodoc
class __$OnSubtaskUpdatedCopyWithImpl<$Res>
    extends _$DetailsEventCopyWithImpl<$Res>
    implements _$OnSubtaskUpdatedCopyWith<$Res> {
  __$OnSubtaskUpdatedCopyWithImpl(
      _OnSubtaskUpdated _value, $Res Function(_OnSubtaskUpdated) _then)
      : super(_value, (v) => _then(v as _OnSubtaskUpdated));

  @override
  _OnSubtaskUpdated get _value => super._value as _OnSubtaskUpdated;

  @override
  $Res call({
    Object? index = freezed,
    Object? value = freezed,
  }) {
    return _then(_OnSubtaskUpdated(
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnSubtaskUpdated implements _OnSubtaskUpdated {
  const _$_OnSubtaskUpdated(this.index, this.value);

  @override
  final int index;
  @override
  final String value;

  @override
  String toString() {
    return 'DetailsEvent.onSubtaskUpdated(index: $index, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnSubtaskUpdated &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$OnSubtaskUpdatedCopyWith<_OnSubtaskUpdated> get copyWith =>
      __$OnSubtaskUpdatedCopyWithImpl<_OnSubtaskUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Tlist> taskLists, Tlist activeTaskList, Task task)
        started,
    required TResult Function(String value) onNameChanged,
    required TResult Function(String value) onDetailsChanged,
    required TResult Function() onSubtaskAdded,
    required TResult Function(int index) onSubtaskRemoved,
    required TResult Function(int index) onSubtaskCompleted,
    required TResult Function(int index, String value) onSubtaskUpdated,
    required TResult Function(DateTime? value) onDateChanged,
    required TResult Function(Tlist taskList) onTaskListChanged,
  }) {
    return onSubtaskUpdated(index, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Tlist> taskLists, Tlist activeTaskList, Task task)?
        started,
    TResult Function(String value)? onNameChanged,
    TResult Function(String value)? onDetailsChanged,
    TResult Function()? onSubtaskAdded,
    TResult Function(int index)? onSubtaskRemoved,
    TResult Function(int index)? onSubtaskCompleted,
    TResult Function(int index, String value)? onSubtaskUpdated,
    TResult Function(DateTime? value)? onDateChanged,
    TResult Function(Tlist taskList)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onSubtaskUpdated != null) {
      return onSubtaskUpdated(index, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnNameChanged value) onNameChanged,
    required TResult Function(_OnDetailsChanged value) onDetailsChanged,
    required TResult Function(_OnSubtaskAdded value) onSubtaskAdded,
    required TResult Function(_OnSubtaskRemoved value) onSubtaskRemoved,
    required TResult Function(_OnSubtaskCompleted value) onSubtaskCompleted,
    required TResult Function(_OnSubtaskUpdated value) onSubtaskUpdated,
    required TResult Function(_OnDateChanged value) onDateChanged,
    required TResult Function(_OnTaskListChanged value) onTaskListChanged,
  }) {
    return onSubtaskUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnNameChanged value)? onNameChanged,
    TResult Function(_OnDetailsChanged value)? onDetailsChanged,
    TResult Function(_OnSubtaskAdded value)? onSubtaskAdded,
    TResult Function(_OnSubtaskRemoved value)? onSubtaskRemoved,
    TResult Function(_OnSubtaskCompleted value)? onSubtaskCompleted,
    TResult Function(_OnSubtaskUpdated value)? onSubtaskUpdated,
    TResult Function(_OnDateChanged value)? onDateChanged,
    TResult Function(_OnTaskListChanged value)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onSubtaskUpdated != null) {
      return onSubtaskUpdated(this);
    }
    return orElse();
  }
}

abstract class _OnSubtaskUpdated implements DetailsEvent {
  const factory _OnSubtaskUpdated(int index, String value) =
      _$_OnSubtaskUpdated;

  int get index => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$OnSubtaskUpdatedCopyWith<_OnSubtaskUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnDateChangedCopyWith<$Res> {
  factory _$OnDateChangedCopyWith(
          _OnDateChanged value, $Res Function(_OnDateChanged) then) =
      __$OnDateChangedCopyWithImpl<$Res>;
  $Res call({DateTime? value});
}

/// @nodoc
class __$OnDateChangedCopyWithImpl<$Res>
    extends _$DetailsEventCopyWithImpl<$Res>
    implements _$OnDateChangedCopyWith<$Res> {
  __$OnDateChangedCopyWithImpl(
      _OnDateChanged _value, $Res Function(_OnDateChanged) _then)
      : super(_value, (v) => _then(v as _OnDateChanged));

  @override
  _OnDateChanged get _value => super._value as _OnDateChanged;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_OnDateChanged(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_OnDateChanged implements _OnDateChanged {
  const _$_OnDateChanged(this.value);

  @override
  final DateTime? value;

  @override
  String toString() {
    return 'DetailsEvent.onDateChanged(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnDateChanged &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$OnDateChangedCopyWith<_OnDateChanged> get copyWith =>
      __$OnDateChangedCopyWithImpl<_OnDateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Tlist> taskLists, Tlist activeTaskList, Task task)
        started,
    required TResult Function(String value) onNameChanged,
    required TResult Function(String value) onDetailsChanged,
    required TResult Function() onSubtaskAdded,
    required TResult Function(int index) onSubtaskRemoved,
    required TResult Function(int index) onSubtaskCompleted,
    required TResult Function(int index, String value) onSubtaskUpdated,
    required TResult Function(DateTime? value) onDateChanged,
    required TResult Function(Tlist taskList) onTaskListChanged,
  }) {
    return onDateChanged(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Tlist> taskLists, Tlist activeTaskList, Task task)?
        started,
    TResult Function(String value)? onNameChanged,
    TResult Function(String value)? onDetailsChanged,
    TResult Function()? onSubtaskAdded,
    TResult Function(int index)? onSubtaskRemoved,
    TResult Function(int index)? onSubtaskCompleted,
    TResult Function(int index, String value)? onSubtaskUpdated,
    TResult Function(DateTime? value)? onDateChanged,
    TResult Function(Tlist taskList)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onDateChanged != null) {
      return onDateChanged(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnNameChanged value) onNameChanged,
    required TResult Function(_OnDetailsChanged value) onDetailsChanged,
    required TResult Function(_OnSubtaskAdded value) onSubtaskAdded,
    required TResult Function(_OnSubtaskRemoved value) onSubtaskRemoved,
    required TResult Function(_OnSubtaskCompleted value) onSubtaskCompleted,
    required TResult Function(_OnSubtaskUpdated value) onSubtaskUpdated,
    required TResult Function(_OnDateChanged value) onDateChanged,
    required TResult Function(_OnTaskListChanged value) onTaskListChanged,
  }) {
    return onDateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnNameChanged value)? onNameChanged,
    TResult Function(_OnDetailsChanged value)? onDetailsChanged,
    TResult Function(_OnSubtaskAdded value)? onSubtaskAdded,
    TResult Function(_OnSubtaskRemoved value)? onSubtaskRemoved,
    TResult Function(_OnSubtaskCompleted value)? onSubtaskCompleted,
    TResult Function(_OnSubtaskUpdated value)? onSubtaskUpdated,
    TResult Function(_OnDateChanged value)? onDateChanged,
    TResult Function(_OnTaskListChanged value)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onDateChanged != null) {
      return onDateChanged(this);
    }
    return orElse();
  }
}

abstract class _OnDateChanged implements DetailsEvent {
  const factory _OnDateChanged(DateTime? value) = _$_OnDateChanged;

  DateTime? get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$OnDateChangedCopyWith<_OnDateChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OnTaskListChangedCopyWith<$Res> {
  factory _$OnTaskListChangedCopyWith(
          _OnTaskListChanged value, $Res Function(_OnTaskListChanged) then) =
      __$OnTaskListChangedCopyWithImpl<$Res>;
  $Res call({Tlist taskList});

  $TlistCopyWith<$Res> get taskList;
}

/// @nodoc
class __$OnTaskListChangedCopyWithImpl<$Res>
    extends _$DetailsEventCopyWithImpl<$Res>
    implements _$OnTaskListChangedCopyWith<$Res> {
  __$OnTaskListChangedCopyWithImpl(
      _OnTaskListChanged _value, $Res Function(_OnTaskListChanged) _then)
      : super(_value, (v) => _then(v as _OnTaskListChanged));

  @override
  _OnTaskListChanged get _value => super._value as _OnTaskListChanged;

  @override
  $Res call({
    Object? taskList = freezed,
  }) {
    return _then(_OnTaskListChanged(
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

class _$_OnTaskListChanged implements _OnTaskListChanged {
  const _$_OnTaskListChanged(this.taskList);

  @override
  final Tlist taskList;

  @override
  String toString() {
    return 'DetailsEvent.onTaskListChanged(taskList: $taskList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OnTaskListChanged &&
            (identical(other.taskList, taskList) ||
                const DeepCollectionEquality()
                    .equals(other.taskList, taskList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(taskList);

  @JsonKey(ignore: true)
  @override
  _$OnTaskListChangedCopyWith<_OnTaskListChanged> get copyWith =>
      __$OnTaskListChangedCopyWithImpl<_OnTaskListChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Tlist> taskLists, Tlist activeTaskList, Task task)
        started,
    required TResult Function(String value) onNameChanged,
    required TResult Function(String value) onDetailsChanged,
    required TResult Function() onSubtaskAdded,
    required TResult Function(int index) onSubtaskRemoved,
    required TResult Function(int index) onSubtaskCompleted,
    required TResult Function(int index, String value) onSubtaskUpdated,
    required TResult Function(DateTime? value) onDateChanged,
    required TResult Function(Tlist taskList) onTaskListChanged,
  }) {
    return onTaskListChanged(taskList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Tlist> taskLists, Tlist activeTaskList, Task task)?
        started,
    TResult Function(String value)? onNameChanged,
    TResult Function(String value)? onDetailsChanged,
    TResult Function()? onSubtaskAdded,
    TResult Function(int index)? onSubtaskRemoved,
    TResult Function(int index)? onSubtaskCompleted,
    TResult Function(int index, String value)? onSubtaskUpdated,
    TResult Function(DateTime? value)? onDateChanged,
    TResult Function(Tlist taskList)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onTaskListChanged != null) {
      return onTaskListChanged(taskList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnNameChanged value) onNameChanged,
    required TResult Function(_OnDetailsChanged value) onDetailsChanged,
    required TResult Function(_OnSubtaskAdded value) onSubtaskAdded,
    required TResult Function(_OnSubtaskRemoved value) onSubtaskRemoved,
    required TResult Function(_OnSubtaskCompleted value) onSubtaskCompleted,
    required TResult Function(_OnSubtaskUpdated value) onSubtaskUpdated,
    required TResult Function(_OnDateChanged value) onDateChanged,
    required TResult Function(_OnTaskListChanged value) onTaskListChanged,
  }) {
    return onTaskListChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnNameChanged value)? onNameChanged,
    TResult Function(_OnDetailsChanged value)? onDetailsChanged,
    TResult Function(_OnSubtaskAdded value)? onSubtaskAdded,
    TResult Function(_OnSubtaskRemoved value)? onSubtaskRemoved,
    TResult Function(_OnSubtaskCompleted value)? onSubtaskCompleted,
    TResult Function(_OnSubtaskUpdated value)? onSubtaskUpdated,
    TResult Function(_OnDateChanged value)? onDateChanged,
    TResult Function(_OnTaskListChanged value)? onTaskListChanged,
    required TResult orElse(),
  }) {
    if (onTaskListChanged != null) {
      return onTaskListChanged(this);
    }
    return orElse();
  }
}

abstract class _OnTaskListChanged implements DetailsEvent {
  const factory _OnTaskListChanged(Tlist taskList) = _$_OnTaskListChanged;

  Tlist get taskList => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$OnTaskListChangedCopyWith<_OnTaskListChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DetailsStateTearOff {
  const _$DetailsStateTearOff();

  _DetailsState call(
      {required List<Tlist> taskLists,
      required Tlist activeTaskList,
      required Task task}) {
    return _DetailsState(
      taskLists: taskLists,
      activeTaskList: activeTaskList,
      task: task,
    );
  }
}

/// @nodoc
const $DetailsState = _$DetailsStateTearOff();

/// @nodoc
mixin _$DetailsState {
  List<Tlist> get taskLists => throw _privateConstructorUsedError;
  Tlist get activeTaskList => throw _privateConstructorUsedError;
  Task get task => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsStateCopyWith<DetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsStateCopyWith<$Res> {
  factory $DetailsStateCopyWith(
          DetailsState value, $Res Function(DetailsState) then) =
      _$DetailsStateCopyWithImpl<$Res>;
  $Res call({List<Tlist> taskLists, Tlist activeTaskList, Task task});

  $TlistCopyWith<$Res> get activeTaskList;
  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class _$DetailsStateCopyWithImpl<$Res> implements $DetailsStateCopyWith<$Res> {
  _$DetailsStateCopyWithImpl(this._value, this._then);

  final DetailsState _value;
  // ignore: unused_field
  final $Res Function(DetailsState) _then;

  @override
  $Res call({
    Object? taskLists = freezed,
    Object? activeTaskList = freezed,
    Object? task = freezed,
  }) {
    return _then(_value.copyWith(
      taskLists: taskLists == freezed
          ? _value.taskLists
          : taskLists // ignore: cast_nullable_to_non_nullable
              as List<Tlist>,
      activeTaskList: activeTaskList == freezed
          ? _value.activeTaskList
          : activeTaskList // ignore: cast_nullable_to_non_nullable
              as Tlist,
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }

  @override
  $TlistCopyWith<$Res> get activeTaskList {
    return $TlistCopyWith<$Res>(_value.activeTaskList, (value) {
      return _then(_value.copyWith(activeTaskList: value));
    });
  }

  @override
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc
abstract class _$DetailsStateCopyWith<$Res>
    implements $DetailsStateCopyWith<$Res> {
  factory _$DetailsStateCopyWith(
          _DetailsState value, $Res Function(_DetailsState) then) =
      __$DetailsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Tlist> taskLists, Tlist activeTaskList, Task task});

  @override
  $TlistCopyWith<$Res> get activeTaskList;
  @override
  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$DetailsStateCopyWithImpl<$Res> extends _$DetailsStateCopyWithImpl<$Res>
    implements _$DetailsStateCopyWith<$Res> {
  __$DetailsStateCopyWithImpl(
      _DetailsState _value, $Res Function(_DetailsState) _then)
      : super(_value, (v) => _then(v as _DetailsState));

  @override
  _DetailsState get _value => super._value as _DetailsState;

  @override
  $Res call({
    Object? taskLists = freezed,
    Object? activeTaskList = freezed,
    Object? task = freezed,
  }) {
    return _then(_DetailsState(
      taskLists: taskLists == freezed
          ? _value.taskLists
          : taskLists // ignore: cast_nullable_to_non_nullable
              as List<Tlist>,
      activeTaskList: activeTaskList == freezed
          ? _value.activeTaskList
          : activeTaskList // ignore: cast_nullable_to_non_nullable
              as Tlist,
      task: task == freezed
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }
}

/// @nodoc

class _$_DetailsState implements _DetailsState {
  const _$_DetailsState(
      {required this.taskLists,
      required this.activeTaskList,
      required this.task});

  @override
  final List<Tlist> taskLists;
  @override
  final Tlist activeTaskList;
  @override
  final Task task;

  @override
  String toString() {
    return 'DetailsState(taskLists: $taskLists, activeTaskList: $activeTaskList, task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DetailsState &&
            (identical(other.taskLists, taskLists) ||
                const DeepCollectionEquality()
                    .equals(other.taskLists, taskLists)) &&
            (identical(other.activeTaskList, activeTaskList) ||
                const DeepCollectionEquality()
                    .equals(other.activeTaskList, activeTaskList)) &&
            (identical(other.task, task) ||
                const DeepCollectionEquality().equals(other.task, task)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(taskLists) ^
      const DeepCollectionEquality().hash(activeTaskList) ^
      const DeepCollectionEquality().hash(task);

  @JsonKey(ignore: true)
  @override
  _$DetailsStateCopyWith<_DetailsState> get copyWith =>
      __$DetailsStateCopyWithImpl<_DetailsState>(this, _$identity);
}

abstract class _DetailsState implements DetailsState {
  const factory _DetailsState(
      {required List<Tlist> taskLists,
      required Tlist activeTaskList,
      required Task task}) = _$_DetailsState;

  @override
  List<Tlist> get taskLists => throw _privateConstructorUsedError;
  @override
  Tlist get activeTaskList => throw _privateConstructorUsedError;
  @override
  Task get task => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DetailsStateCopyWith<_DetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
