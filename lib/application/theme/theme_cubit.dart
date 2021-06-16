import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());
  late Box<dynamic> settingsBox;
  started() {
    settingsBox = Hive.box('settings');
    final bool darkTheme = settingsBox.get('darkTheme') ?? false;
    if (darkTheme) {
      emit(ThemeState.dark());
    } else {
      emit(ThemeState.light());
    }
  }

  toggleTheme() {
    state.map(
      light: (_) {
        settingsBox.put('darkTheme', true);
        emit(ThemeState.dark());
      },
      dark: (_) {
        settingsBox.put('darkTheme', false);
        emit(ThemeState.light());
      },
    );
  }
}
