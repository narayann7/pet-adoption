import 'package:flutter/material.dart';

class PetDetailsView extends StatelessWidget {
  const PetDetailsView({Key? key}) : super(key: key);
  static const String routeName = '/petDetailsView';

  static MaterialPageRoute getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/petDetailsView"),
        builder: (c) {
          return const PetDetailsView();
        });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Pet Details'),
      ), // Cente
    );
  }
}
