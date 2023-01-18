import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String routeName = '/';

  static getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/"),
        builder: (c) {
          return const HomeView();
        });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      ), // Cente
    );
  }
}
