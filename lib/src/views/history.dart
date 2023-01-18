import 'package:flutter/material.dart';
import 'package:pet_adoption_app/src/views/common.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);
  static const String routeName = '/historyView';

  static MaterialPageRoute getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/historyView"),
        builder: (c) {
          return const HistoryView();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppBar(),
      body: const Center(
        child: Text('History'),
      ), // Cente
    );
  }
}
