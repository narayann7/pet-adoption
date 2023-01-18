import 'package:flutter/material.dart';
import 'package:pet_adoption_app/src/utils/coustom_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pet Adoption App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: CustomRoutes.generateRoute,
    );
  }
}
