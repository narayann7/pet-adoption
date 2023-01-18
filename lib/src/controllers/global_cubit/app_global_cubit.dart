import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption_app/src/utils/shared_preferences_services.dart';
import 'package:pet_adoption_app/src/utils/themes.dart';

part 'app_global_state.dart';

class AppGlobalCubit extends Cubit<AppGlobalState> {
  AppGlobalCubit() : super(AppGlobalState.initial());

  void toggleTheme() async {
    bool? isDark = await SharedPreferencesService.getTheme();
    isDark = !isDark!;
    log("isDark: $isDark");
    SharedPreferencesService.saveTheme(isDark: isDark);
    if (isDark) {
      emit(state.copyWith(
        isDark: isDark,
        currentTheme: AppTheme.darkTheme,
      ));
    } else {
      emit(state.copyWith(
        isDark: isDark,
        currentTheme: AppTheme.lightTheme,
      ));
    }
  }

  void changeBottomNavIndex(int index) {
    emit(state.copyWith(buttomNavIndex: index));
  }
}