import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_adoption_app/src/utils/constants.dart';

void moveToNextScreen(BuildContext context, String screen) {
  Navigator.of(context).pushNamed(screen);
}

void moveToNextScreenWithArguments(
    BuildContext context, String screen, Object arguments) {
  Navigator.of(context).pushNamed(screen, arguments: arguments);
}

// ignore: constant_identifier_names

enum FontStyle {
  heading,
  heading2,
  subheading,
  title,
  subtitle,
  boldTitle,
  boldSubtitle,
  appbarTitle,
  h14,
  h16
}

class AppText extends StatelessWidget {
  AppText(
    this.text, {
    this.maxLines,
    this.style,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.type,
    Key? key,
  }) : super(key: key);
  final String text;
  final int? maxLines;
  final TextStyle? style;
  TextAlign? textAlign = TextAlign.center;

  double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  FontStyle? type = FontStyle.title;

  @override
  Widget build(BuildContext context) {
    var style = getStyle(type);

    return Text(
      text.toString(),
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: style.merge(style),
    );
  }

  TextStyle getStyle(FontStyle? type) {
    switch (type) {
      case FontStyle.heading:
        return GoogleFonts.getFont(appFont).copyWith(
            fontSize: fontSize ?? 22,
            color: color ?? Colors.black,
            letterSpacing: 0.8,
            fontWeight: fontWeight ?? FontWeight.bold);
      case FontStyle.heading2:
        return GoogleFonts.getFont(appFont).copyWith(
            fontSize: fontSize ?? 19,
            color: color ?? Colors.black,
            letterSpacing: 0.8,
            fontWeight: fontWeight ?? FontWeight.bold);
      case FontStyle.title:
        return GoogleFonts.getFont(appFont).copyWith(
            fontSize: fontSize ?? 16,
            color: color ?? Colors.black,
            fontWeight: fontWeight ?? FontWeight.w500);
      case FontStyle.subheading:
        return GoogleFonts.getFont(appFont).copyWith(
            fontSize: fontSize ?? 18,
            color: color ?? Colors.black,
            fontWeight: fontWeight ?? FontWeight.w500);
      case FontStyle.boldTitle:
        return GoogleFonts.getFont(appFont).copyWith(
            fontSize: fontSize ?? 18,
            color: color ?? Colors.black,
            fontWeight: fontWeight ?? FontWeight.bold);
      case FontStyle.subtitle:
        return GoogleFonts.getFont(appFont).copyWith(
            fontSize: fontSize ?? 13,
            color: color ?? const Color(0xff222222),
            fontWeight: fontWeight ?? FontWeight.normal);
      case FontStyle.boldSubtitle:
        return GoogleFonts.getFont(appFont).copyWith(
            fontSize: fontSize ?? 16,
            color: color ?? const Color(0xff222222),
            fontWeight: fontWeight ?? FontWeight.bold);
      default:
        return GoogleFonts.getFont(appFont).copyWith(
          color: color ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize ?? 17,
        );
    }
  }
}
