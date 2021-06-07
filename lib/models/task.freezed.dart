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
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      @HiveField(2) String? details,
      @HiveField(3) DateTime? dateTime,
      @HiveField(4) bool completed = false,
      @HiveField(5) List<String> subtasks = const []}) {
    return _Task(
      id: id,
      name: name,
      details: details,
      dateTime: dateTime,
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
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get details => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime? get dateTime => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get completed => throw _privateConstructorUsedError;
  @HiveField(5)
  List<String> get subtasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String? details,
      @HiveField(3) DateTime? dateTime,
      @HiveField(4) bool completed,
      @HiveField(5) List<String> subtasks});
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
    Object? details = freezed,
    Object? dateTime = freezed,
    Object? completed = freezed,
    Object? subtasks = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      subtasks: subtasks == freezed
          ? _value.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) then) =
      __$TaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String? details,
      @HiveField(3) DateTime? dateTime,
      @HiveField(4) bool completed,
      @HiveField(5) List<String> subtasks});
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
    Object? details = freezed,
    Object? dateTime = freezed,
    Object? completed = freezed,
    Object? subtasks = freezed,
  }) {
    return _then(_Task(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      subtasks: subtasks == freezed
          ? _value.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Task implements _Task {
  const _$_Task(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) this.details,
      @HiveField(3) this.dateTime,
      @HiveField(4) this.completed = false,
      @HiveField(5) this.subtasks = const []});

  factory _$_Task.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String? details;
  @override
  @HiveField(3)
  final DateTime? dateTime;
  @JsonKey(defaultValue: false)
  @override
  @HiveField(4)
  final bool completed;
  @JsonKey(defaultValue: const [])
  @override
  @HiveField(5)
  final List<String> subtasks;

  @override
  String toString() {
    return 'Task(id: $id, name: $name, details: $details, dateTime: $dateTime, completed: $completed, subtasks: $subtasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Task &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality()
                    .equals(other.details, details)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)) &&
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
      const DeepCollectionEquality().hash(details) ^
      const DeepCollectionEquality().hash(dateTime) ^
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
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      @HiveField(2) String? details,
      @HiveField(3) DateTime? dateTime,
      @HiveField(4) bool completed,
      @HiveField(5) List<String> subtasks}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String? get details => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  DateTime? get dateTime => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  bool get completed => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  List<String> get subtasks => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TaskCopyWith<_Task> get copyWith => throw _privateConstructorUsedError;
}
