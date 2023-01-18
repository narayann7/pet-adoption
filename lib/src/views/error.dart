import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);
  static const String routeName = '/ErrorView';

  static getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/ErrorView"),
        builder: (c) {
          return const ErrorView();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
