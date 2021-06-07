// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'tlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tlist _$TlistFromJson(Map<String, dynamic> json) {
  return _Tlist.fromJson(json);
}

/// @nodoc
class _$TlistTearOff {
  const _$TlistTearOff();

  _Tlist call(
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      List<Task> tasks = const []}) {
    return _Tlist(
      id: id,
      name: name,
      tasks: tasks,
    );
  }

  Tlist fromJson(Map<String, Object> json) {
    return Tlist.fromJson(json);
  }
}

/// @nodoc
const $Tlist = _$TlistTearOff();

/// @nodoc
mixin _$Tlist {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  List<Task> get tasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TlistCopyWith<Tlist> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TlistCopyWith<$Res> {
  factory $TlistCopyWith(Tlist value, $Res Function(Tlist) then) =
      _$TlistCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id, @HiveField(1) String name, List<Task> tasks});
}

/// @nodoc
class _$TlistCopyWithImpl<$Res> implements $TlistCopyWith<$Res> {
  _$TlistCopyWithImpl(this._value, this._then);

  final Tlist _value;
  // ignore: unused_field
  final $Res Function(Tlist) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? tasks = freezed,
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
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc
abstract class _$TlistCopyWith<$Res> implements $TlistCopyWith<$Res> {
  factory _$TlistCopyWith(_Tlist value, $Res Function(_Tlist) then) =
      __$TlistCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id, @HiveField(1) String name, List<Task> tasks});
}

/// @nodoc
class __$TlistCopyWithImpl<$Res> extends _$TlistCopyWithImpl<$Res>
    implements _$TlistCopyWith<$Res> {
  __$TlistCopyWithImpl(_Tlist _value, $Res Function(_Tlist) _then)
      : super(_value, (v) => _then(v as _Tlist));

  @override
  _Tlist get _value => super._value as _Tlist;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? tasks = freezed,
  }) {
    return _then(_Tlist(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tlist implements _Tlist {
  const _$_Tlist(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      this.tasks = const []});

  factory _$_Tlist.fromJson(Map<String, dynamic> json) =>
      _$_$_TlistFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @JsonKey(defaultValue: const [])
  @override
  final List<Task> tasks;

  @override
  String toString() {
    return 'Tlist(id: $id, name: $name, tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Tlist &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.tasks, tasks) ||
                const DeepCollectionEquality().equals(other.tasks, tasks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(tasks);

  @JsonKey(ignore: true)
  @override
  _$TlistCopyWith<_Tlist> get copyWith =>
      __$TlistCopyWithImpl<_Tlist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TlistToJson(this);
  }
}

abstract class _Tlist implements Tlist {
  const factory _Tlist(
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      List<Task> tasks}) = _$_Tlist;

  factory _Tlist.fromJson(Map<String, dynamic> json) = _$_Tlist.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @override
  List<Task> get tasks => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TlistCopyWith<_Tlist> get copyWith => throw _privateConstructorUsedError;
}
