import 'package:flutter/material.dart';
import 'package:pet_adoption_app/src/app.dart';
import 'package:pet_adoption_app/src/utils/shared_preferences_services.dart';

void main() async {
  await MyApp.myAppInit();
  bool? isDark = await SharedPreferencesService.getTheme();
  runApp(MyApp(isDark: isDark));
}
