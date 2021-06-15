part of 'theme_cubit.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState.light() = _Light;
  const factory ThemeState.dark() = _Dark;

  factory ThemeState.initial() => ThemeState.light();
}
