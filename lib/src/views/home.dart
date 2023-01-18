import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/src/controllers/cubit/app_theme_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String routeName = '/';

  static getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/"),
        builder: (c) {
          return BlocProvider(
              create: (context) => AppThemeCubit(), child: const HomeView());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            log("called");
            context.read<AppThemeCubit>().toggleTheme();
          },
          child: const Chip(
            label: Text('Home'),
          ),
        ),
      ), // Cente
    );
  }
}
