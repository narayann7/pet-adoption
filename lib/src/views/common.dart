import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_adoption_app/src/models/pet_data_model.dart';
import 'package:shimmer/shimmer.dart';

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
  Size get preferredSize => const Size.fromHeight(70);
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
    var style = getStyle(context, type);

    return Text(
      text.toString(),
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: style.merge(style),
    );
  }

  TextStyle getStyle(BuildContext context, FontStyle? type) {
    switch (type) {
      case FontStyle.heading:
        return GoogleFonts.getFont(appFont).copyWith(
            fontSize: fontSize ?? 22,
            color: color ?? Theme.of(context).textTheme.headline1!.color,
            letterSpacing: 0.8,
            fontWeight: fontWeight ?? FontWeight.bold);
      case FontStyle.heading2:
        return GoogleFonts.getFont(appFont).copyWith(
            fontSize: fontSize ?? 19,
            color: color ?? Theme.of(context).textTheme.headline1!.color,
            letterSpacing: 0.8,
            fontWeight: fontWeight ?? FontWeight.bold);
      case FontStyle.title:
        return GoogleFonts.getFont(appFont).copyWith(
            fontSize: fontSize ?? 16,
            color: color ?? Theme.of(context).textTheme.headline1!.color,
            fontWeight: fontWeight ?? FontWeight.w500);
      case FontStyle.subheading:
        return GoogleFonts.getFont(appFont).copyWith(
            fontSize: fontSize ?? 18,
            color: color ?? Theme.of(context).textTheme.headline1!.color,
            fontWeight: fontWeight ?? FontWeight.w500);
      case FontStyle.boldTitle:
        return GoogleFonts.getFont(appFont).copyWith(
            fontSize: fontSize ?? 18,
            color: color ?? Theme.of(context).textTheme.headline1!.color,
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
          color: color ?? Theme.of(context).textTheme.headline1!.color,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize ?? 17,
        );
    }
  }
}

class SinglePet extends StatelessWidget {
  const SinglePet({
    Key? key,
    required this.petDataModel,
    this.onTap,
  }) : super(key: key);
  final PetDataModel petDataModel;
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
            Hero(
              tag: "1234",
              child: Container(
                  height: 300,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                          image: AssetImage("lib/assets/images/dog1.jpg"),
                          fit: BoxFit.cover))),
            ),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            "Lucky (Labrador)",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          CustomText(
                            "\$89",
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getSmallDetails({
  required BuildContext context,
  required String title,
  required String details,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CustomText(
        details,
        fontSize: 18,
      ),
      CustomText(
        title,
        fontSize: 15,
        color: Theme.of(context).textTheme.headline1!.color!.withOpacity(0.5),
      ),
    ],
  );
}

showAlertDialog(BuildContext context, ConfettiController controllerCenterRight,
    ConfettiController controllerCenterLeft) {
  // set up the button
  Widget okButton = const Text("OK");

  // set up the AlertDialog

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          AlertDialog(
              content: CustomText("You have successfully booked the pet name!"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: controllerCenterLeft,
              blastDirection: 0, // radial value - RIGHT
              emissionFrequency: 0.6,
              minimumSize: const Size(10,
                  10), // set the minimum potential size for the confetti (width, height)
              maximumSize: const Size(50,
                  50), // set the maximum potential size for the confetti (width, height)
              numberOfParticles: 1,
              gravity: 0.1,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
              confettiController: controllerCenterRight,
              blastDirection: pi, // radial value - RIGHT
              emissionFrequency: 0.6,
              minimumSize: const Size(10,
                  10), // set the minimum potential size for the confetti (width, height)
              maximumSize: const Size(50,
                  50), // set the maximum potential size for the confetti (width, height)
              numberOfParticles: 1,
              gravity: 0.1,
            ),
          ),
        ],
      );
    },
  );
}

Widget petShimmerCard(BuildContext context) {
  return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
            baseColor: Colors.grey[300] as Color,
            highlightColor: Colors.grey[400] as Color,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(30),
                  border: Border.all(color: Colors.grey)),
            ));
      });
}
