// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
class _$TaskTearOff {
  const _$TaskTearOff();

  _Task call(
      {@HiveField(0) required int id,
      @HiveField(1) required String name,
      @HiveField(2) required int order,
      @HiveField(3) String? details,
      @HiveField(4) DateTime? dateTime,
      @HiveField(5) @TimeOfDayConverter() TimeOfDay? timeOfDay,
      @HiveField(6) bool completed = false,
      @HiveField(7) List<SubTask> subtasks = const []}) {
    return _Task(
      id: id,
      name: name,
      order: order,
      details: details,
      dateTime: dateTime,
      timeOfDay: timeOfDay,
      completed: completed,
      subtasks: subtasks,
    );
  }

  Task fromJson(Map<String, Object> json) {
    return Task.fromJson(json);
  }
}

/// @nodoc
const $Task = _$TaskTearOff();

/// @nodoc
mixin _$Task {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  int get order => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get details => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime? get dateTime => throw _privateConstructorUsedError;
  @HiveField(5)
  @TimeOfDayConverter()
  TimeOfDay? get timeOfDay => throw _privateConstructorUsedError;
  @HiveField(6)
  bool get completed => throw _privateConstructorUsedError;
  @HiveField(7)
  List<SubTask> get subtasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) int order,
      @HiveField(3) String? details,
      @HiveField(4) DateTime? dateTime,
      @HiveField(5) @TimeOfDayConverter() TimeOfDay? timeOfDay,
      @HiveField(6) bool completed,
      @HiveField(7) List<SubTask> subtasks});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? order = freezed,
    Object? details = freezed,
    Object? dateTime = freezed,
    Object? timeOfDay = freezed,
    Object? completed = freezed,
    Object? subtasks = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeOfDay: timeOfDay == freezed
          ? _value.timeOfDay
          : timeOfDay // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      subtasks: subtasks == freezed
          ? _value.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubTask>,
    ));
  }
}

/// @nodoc
abstract class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) then) =
      __$TaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) int order,
      @HiveField(3) String? details,
      @HiveField(4) DateTime? dateTime,
      @HiveField(5) @TimeOfDayConverter() TimeOfDay? timeOfDay,
      @HiveField(6) bool completed,
      @HiveField(7) List<SubTask> subtasks});
}

/// @nodoc
class __$TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(_Task _value, $Res Function(_Task) _then)
      : super(_value, (v) => _then(v as _Task));

  @override
  _Task get _value => super._value as _Task;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? order = freezed,
    Object? details = freezed,
    Object? dateTime = freezed,
    Object? timeOfDay = freezed,
    Object? completed = freezed,
    Object? subtasks = freezed,
  }) {
    return _then(_Task(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeOfDay: timeOfDay == freezed
          ? _value.timeOfDay
          : timeOfDay // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      subtasks: subtasks == freezed
          ? _value.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<SubTask>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Task implements _Task {
  const _$_Task(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.order,
      @HiveField(3) this.details,
      @HiveField(4) this.dateTime,
      @HiveField(5) @TimeOfDayConverter() this.timeOfDay,
      @HiveField(6) this.completed = false,
      @HiveField(7) this.subtasks = const []});

  factory _$_Task.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final int order;
  @override
  @HiveField(3)
  final String? details;
  @override
  @HiveField(4)
  final DateTime? dateTime;
  @override
  @HiveField(5)
  @TimeOfDayConverter()
  final TimeOfDay? timeOfDay;
  @JsonKey(defaultValue: false)
  @override
  @HiveField(6)
  final bool completed;
  @JsonKey(defaultValue: const [])
  @override
  @HiveField(7)
  final List<SubTask> subtasks;

  @override
  String toString() {
    return 'Task(id: $id, name: $name, order: $order, details: $details, dateTime: $dateTime, timeOfDay: $timeOfDay, completed: $completed, subtasks: $subtasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Task &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.order, order) ||
                const DeepCollectionEquality().equals(other.order, order)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality()
                    .equals(other.details, details)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)) &&
            (identical(other.timeOfDay, timeOfDay) ||
                const DeepCollectionEquality()
                    .equals(other.timeOfDay, timeOfDay)) &&
            (identical(other.completed, completed) ||
                const DeepCollectionEquality()
                    .equals(other.completed, completed)) &&
            (identical(other.subtasks, subtasks) ||
                const DeepCollectionEquality()
                    .equals(other.subtasks, subtasks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(order) ^
      const DeepCollectionEquality().hash(details) ^
      const DeepCollectionEquality().hash(dateTime) ^
      const DeepCollectionEquality().hash(timeOfDay) ^
      const DeepCollectionEquality().hash(completed) ^
      const DeepCollectionEquality().hash(subtasks);

  @JsonKey(ignore: true)
  @override
  _$TaskCopyWith<_Task> get copyWith =>
      __$TaskCopyWithImpl<_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskToJson(this);
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {@HiveField(0) required int id,
      @HiveField(1) required String name,
      @HiveField(2) required int order,
      @HiveField(3) String? details,
      @HiveField(4) DateTime? dateTime,
      @HiveField(5) @TimeOfDayConverter() TimeOfDay? timeOfDay,
      @HiveField(6) bool completed,
      @HiveField(7) List<SubTask> subtasks}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  int get order => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String? get details => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  DateTime? get dateTime => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  @TimeOfDayConverter()
  TimeOfDay? get timeOfDay => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  bool get completed => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  List<SubTask> get subtasks => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TaskCopyWith<_Task> get copyWith => throw _privateConstructorUsedError;
}
