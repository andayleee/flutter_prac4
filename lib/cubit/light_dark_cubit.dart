import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'light_dark_state.dart';

class LightDarkCubit extends Cubit<LightDarkState> {
  LightDarkCubit() : super(LightDarkState(theme: ThemeData.light()));
  void switchTheme() {
    if (state.theme == ThemeData.light()) {
      emit(LightDarkState(theme: ThemeData.dark()));
    } else {
      emit(LightDarkState(theme: ThemeData.light()));
    }
  }
}
