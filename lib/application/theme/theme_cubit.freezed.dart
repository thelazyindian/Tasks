// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'theme_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ThemeStateTearOff {
  const _$ThemeStateTearOff();

  _Light light() {
    return const _Light();
  }

  _Dark dark() {
    return const _Dark();
  }
}

/// @nodoc
const $ThemeState = _$ThemeStateTearOff();

/// @nodoc
mixin _$ThemeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() light,
    required TResult Function() dark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Light value) light,
    required TResult Function(_Dark value) dark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Light value)? light,
    TResult Function(_Dark value)? dark,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res> implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  final ThemeState _value;
  // ignore: unused_field
  final $Res Function(ThemeState) _then;
}

/// @nodoc
abstract class _$LightCopyWith<$Res> {
  factory _$LightCopyWith(_Light value, $Res Function(_Light) then) =
      __$LightCopyWithImpl<$Res>;
}

/// @nodoc
class __$LightCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements _$LightCopyWith<$Res> {
  __$LightCopyWithImpl(_Light _value, $Res Function(_Light) _then)
      : super(_value, (v) => _then(v as _Light));

  @override
  _Light get _value => super._value as _Light;
}

/// @nodoc

class _$_Light implements _Light {
  const _$_Light();

  @override
  String toString() {
    return 'ThemeState.light()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Light);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() light,
    required TResult Function() dark,
  }) {
    return light();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Light value) light,
    required TResult Function(_Dark value) dark,
  }) {
    return light(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Light value)? light,
    TResult Function(_Dark value)? dark,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light(this);
    }
    return orElse();
  }
}

abstract class _Light implements ThemeState {
  const factory _Light() = _$_Light;
}

/// @nodoc
abstract class _$DarkCopyWith<$Res> {
  factory _$DarkCopyWith(_Dark value, $Res Function(_Dark) then) =
      __$DarkCopyWithImpl<$Res>;
}

/// @nodoc
class __$DarkCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements _$DarkCopyWith<$Res> {
  __$DarkCopyWithImpl(_Dark _value, $Res Function(_Dark) _then)
      : super(_value, (v) => _then(v as _Dark));

  @override
  _Dark get _value => super._value as _Dark;
}

/// @nodoc

class _$_Dark implements _Dark {
  const _$_Dark();

  @override
  String toString() {
    return 'ThemeState.dark()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Dark);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() light,
    required TResult Function() dark,
  }) {
    return dark();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    required TResult orElse(),
  }) {
    if (dark != null) {
      return dark();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Light value) light,
    required TResult Function(_Dark value) dark,
  }) {
    return dark(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Light value)? light,
    TResult Function(_Dark value)? dark,
    required TResult orElse(),
  }) {
    if (dark != null) {
      return dark(this);
    }
    return orElse();
  }
}

abstract class _Dark implements ThemeState {
  const factory _Dark() = _$_Dark;
}
