import 'package:flutter/material.dart';
import 'package:pet_adoption_app/src/models/pet_data_model.dart';
import 'package:pet_adoption_app/src/views/details.dart';
import 'package:pet_adoption_app/src/views/error.dart';
import 'package:pet_adoption_app/src/views/history.dart';
import 'package:pet_adoption_app/src/views/home.dart';
import 'package:pet_adoption_app/src/views/root.dart';

class CustomRoutes {
  static Route generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments;

    switch (routeSettings.name) {
      case Root.routeName:
        return Root.getNavigator();
      case HomeView.routeName:
        return HomeView.getNavigator();
      case PetDetailsView.routeName:
        if (arguments is PetDataModel) {
          return PetDetailsView.getNavigator(arguments);
        } else {
          return MaterialPageRoute(builder: (c) => const ErrorView());
        }
      case HistoryView.routeName:
        return HistoryView.getNavigator();
      default:
        return MaterialPageRoute(builder: (c) => const ErrorView());
    }
  }
}
