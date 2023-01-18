import 'package:flutter/material.dart';

void moveToNextScreen(BuildContext context, String screen) {
  Navigator.of(context).pushNamed(screen);
}

void moveToNextScreenWithArguments(
    BuildContext context, String screen, Object arguments) {
  Navigator.of(context).pushNamed(screen, arguments: arguments);
}



// getToast(
//   BuildContext context,
//   String message,
// ) {
//   return Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: white,
//       textColor: black,
//       fontSize: 16.0);
// }
