import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    backgroundColor: Colors.white,
    primaryColorDark: const Color(0xff2C3E50),
    cardColor: const Color.fromARGB(255, 230, 228, 232),
    dividerColor: const Color.fromARGB(255, 185, 192, 199),
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
    iconTheme: const IconThemeData(color: Color(0xff333F52)),
    textTheme: const TextTheme(
      headline1: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      headline2: TextStyle(color: Color(0xff333F52)),
      subtitle1: TextStyle(color: Color(0xff747C88)),
      subtitle2: TextStyle(color: Color(0xffABB2B9)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff7C77B9),
    primaryColorDark: const Color(0xffFFFFFF),
    dividerColor: const Color.fromARGB(255, 82, 85, 99),
    iconTheme: const IconThemeData(color: Color(0xffffffff)),
    backgroundColor: const Color(0xff171820),
    cardColor: const Color.fromARGB(255, 45, 46, 60),
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
    textTheme: const TextTheme(
      headline1: TextStyle(color: Color(0xffFFFFFF)),
      headline2: TextStyle(color: Color(0xffFFFFFF)),
      subtitle1: TextStyle(color: Color(0xff747C88)),
      subtitle2: TextStyle(color: Color(0xffABB2B9)),
    ),
  );

  //extraFunctions
  static getGrey(BuildContext context) {
    return AppTheme.isdark(context)
        ? const Color(0xff4D4E58)
        : const Color(0xffF3F6F8);
  }

  static isdark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
