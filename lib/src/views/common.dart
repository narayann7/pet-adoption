import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pet_adoption_app/src/controllers/global_cubit/app_global_cubit.dart';
import 'package:pet_adoption_app/src/utils/common_function.dart';
import 'package:pet_adoption_app/src/utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppGlobalCubit, AppGlobalState>(
      builder: (context, state) {
        return AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CustomText(
              state.buttomNavIndex == 0 ? greetingMessage() : "History",
              type: FontStyle.appbarTitle,
              fontSize: 30,
              color: Theme.of(context).textTheme.headline1!.color,
              fontWeight: FontWeight.w800,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 10),
              child: IconButton(
                icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, anim) => RotationTransition(
                          turns: child.key == const ValueKey('icon1')
                              ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                              : Tween<double>(begin: 0.75, end: 1)
                                  .animate(anim),
                          child: FadeTransition(opacity: anim, child: child),
                        ),
                    child: state.isDark
                        ? Icon(Icons.sunny,
                            color: Theme.of(context).textTheme.headline1!.color,
                            key: const ValueKey('icon1'))
                        : Icon(
                            Icons.nightlight_round,
                            color: Theme.of(context).textTheme.headline1!.color,
                            key: const ValueKey('icon2'),
                          )),
                onPressed: () {
                  context.read<AppGlobalCubit>().toggleTheme();
                },
              ),
            )
          ],
        );
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);
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

class CustomText extends StatelessWidget {
  CustomText(
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

class SinglePet extends StatelessWidget {
  const SinglePet({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.85;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        width: width,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            Container(
                height: 300,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                        image: AssetImage("lib/assets/images/dog1.jpg"),
                        fit: BoxFit.cover))),
            Positioned(
              bottom: 0,
              child: GlassContainer(
                borderRadius: BorderRadius.circular(25),
                blur: 8,
                opacity: 0.1,
                child: Container(
                    width: width,
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey.withOpacity(0.7),
                            Colors.grey.withOpacity(0.14),
                          ],
                          begin: AlignmentDirectional.topStart,
                          end: AlignmentDirectional.bottomEnd,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(230, 90, 90, 90)
                                .withOpacity(0.25),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
