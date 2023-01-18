import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    backgroundColor: const Color(0xffFAF9FA),
    primaryColorDark: const Color(0xff2C3E50),
    cardColor: const Color(0xffFFFFFF),
    dividerColor: const Color(0xffDCE3EB),
    iconTheme: const IconThemeData(color: Color(0xff333F52)),
    textTheme: const TextTheme(
      headline1: TextStyle(color: Color(0xff1F2E35)),
      headline2: TextStyle(color: Color(0xff333F52)),
      subtitle1: TextStyle(color: Color(0xff747C88)),
      subtitle2: TextStyle(color: Color(0xffABB2B9)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff01020A),
    primaryColorDark: const Color(0xffFFFFFF),
    dividerColor: const Color(0xff33353F),
    iconTheme: const IconThemeData(color: Color(0xffffffff)),
    backgroundColor: const Color(0xff171820),
    cardColor: const Color(0xff22232E),
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