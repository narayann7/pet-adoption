import 'package:flutter/material.dart';
import 'package:pet_adoption_app/src/views/details.dart';
import 'package:pet_adoption_app/src/views/error.dart';
import 'package:pet_adoption_app/src/views/history.dart';
import 'package:pet_adoption_app/src/views/home.dart';

class CustomRoutes {
  static Route generateRoute(RouteSettings routeSettings) {
    // var args = routeSettings.arguments;

    switch (routeSettings.name) {
      case HomeView.routeName:
        return HomeView.getNavigator();
      case PetDetailsView.routeName:
        return PetDetailsView.getNavigator();
      case HistoryView.routeName:
        return HistoryView.getNavigator();
      default:
        return MaterialPageRoute(builder: (c) => const ErrorView());
    }
  }
}
