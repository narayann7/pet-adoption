import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption_app/src/utils/shared_preferences_services.dart';
import 'package:pet_adoption_app/src/utils/themes.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeState.initial());

  void toggleTheme() async {
    bool? isDark = await SharedPreferencesService.getTheme();
    isDark = !isDark!;
    await SharedPreferencesService.saveTheme(isDark: isDark);
    if (isDark) {
      emit(AppThemeState(
        isDark: isDark,
        currentTheme: AppTheme.darkTheme,
      ));
    } else {
      emit(AppThemeState(
        isDark: isDark,
        currentTheme: AppTheme.lightTheme,
      ));
    }
  }
}
