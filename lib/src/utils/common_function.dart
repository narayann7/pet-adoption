import 'package:flutter/material.dart';

//navigate to next screen
void moveToNextScreen(BuildContext context, String screen) {
  Navigator.of(context).pushNamed(screen);
}

//arguments is an object that can be passed to the next screen
void moveToNextScreenWithArguments(
    BuildContext context, String screen, Object arguments) {
  Navigator.of(context).pushNamed(screen, arguments: arguments);
}

//greeting message according to time
String greetingMessage() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 17) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}
