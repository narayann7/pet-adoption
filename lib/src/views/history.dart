import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);
  static const String routeName = '/HistoryView';

  static MaterialPageRoute getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/HistoryView"),
        builder: (c) {
          return const HistoryView();
        });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('History'),
      ), // Cente
    );
  }
}
