import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  toggleTheme() => emit(
        state.map(
          light: (_) => ThemeState.dark(),
          dark: (_) => ThemeState.light(),
        ),
      );
}
