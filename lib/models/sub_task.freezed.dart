// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sub_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubTask _$SubTaskFromJson(Map<String, dynamic> json) {
  return _SubTask.fromJson(json);
}

/// @nodoc
class _$SubTaskTearOff {
  const _$SubTaskTearOff();

  _SubTask call({required String id, String? name, bool completed = false}) {
    return _SubTask(
      id: id,
      name: name,
      completed: completed,
    );
  }

  SubTask fromJson(Map<String, Object> json) {
    return SubTask.fromJson(json);
  }
}

/// @nodoc
const $SubTask = _$SubTaskTearOff();

/// @nodoc
mixin _$SubTask {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubTaskCopyWith<SubTask> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubTaskCopyWith<$Res> {
  factory $SubTaskCopyWith(SubTask value, $Res Function(SubTask) then) =
      _$SubTaskCopyWithImpl<$Res>;
  $Res call({String id, String? name, bool completed});
}

/// @nodoc
class _$SubTaskCopyWithImpl<$Res> implements $SubTaskCopyWith<$Res> {
  _$SubTaskCopyWithImpl(this._value, this._then);

  final SubTask _value;
  // ignore: unused_field
  final $Res Function(SubTask) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SubTaskCopyWith<$Res> implements $SubTaskCopyWith<$Res> {
  factory _$SubTaskCopyWith(_SubTask value, $Res Function(_SubTask) then) =
      __$SubTaskCopyWithImpl<$Res>;
  @override
  $Res call({String id, String? name, bool completed});
}

/// @nodoc
class __$SubTaskCopyWithImpl<$Res> extends _$SubTaskCopyWithImpl<$Res>
    implements _$SubTaskCopyWith<$Res> {
  __$SubTaskCopyWithImpl(_SubTask _value, $Res Function(_SubTask) _then)
      : super(_value, (v) => _then(v as _SubTask));

  @override
  _SubTask get _value => super._value as _SubTask;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? completed = freezed,
  }) {
    return _then(_SubTask(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubTask implements _SubTask {
  const _$_SubTask({required this.id, this.name, this.completed = false});

  factory _$_SubTask.fromJson(Map<String, dynamic> json) =>
      _$_$_SubTaskFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @JsonKey(defaultValue: false)
  @override
  final bool completed;

  @override
  String toString() {
    return 'SubTask(id: $id, name: $name, completed: $completed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubTask &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.completed, completed) ||
                const DeepCollectionEquality()
                    .equals(other.completed, completed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(completed);

  @JsonKey(ignore: true)
  @override
  _$SubTaskCopyWith<_SubTask> get copyWith =>
      __$SubTaskCopyWithImpl<_SubTask>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubTaskToJson(this);
  }
}

abstract class _SubTask implements SubTask {
  const factory _SubTask({required String id, String? name, bool completed}) =
      _$_SubTask;

  factory _SubTask.fromJson(Map<String, dynamic> json) = _$_SubTask.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  bool get completed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SubTaskCopyWith<_SubTask> get copyWith =>
      throw _privateConstructorUsedError;
}
