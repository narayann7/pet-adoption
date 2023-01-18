import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/src/controllers/cubit/app_theme_cubit.dart';
import 'package:pet_adoption_app/src/utils/common_function.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String routeName = '/';

  static MaterialPageRoute getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/"),
        builder: (c) {
          return BlocProvider(
              create: (context) => AppThemeCubit(), child: const HomeView());
        });
  }

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).backgroundColor,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: AppText(
                'Good Morning',
                type: FontStyle.appbarTitle,
                fontSize: 30,
                color: Theme.of(context).textTheme.headline1!.color,
                fontWeight: FontWeight.w800,
              ),
            ),
            actions: [
              IconButton(
                icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, anim) => RotationTransition(
                          turns: child.key == const ValueKey('icon1')
                              ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                              : Tween<double>(begin: 0.75, end: 1)
                                  .animate(anim),
                          child: FadeTransition(opacity: anim, child: child),
                        ),
                    child: _currIndex == 0
                        ? const Icon(Icons.sunny,
                            color: Colors.black, key: ValueKey('icon1'))
                        : const Icon(
                            Icons.nightlight_round,
                            color: Colors.black,
                            key: ValueKey('icon2'),
                          )),
                onPressed: () {
                  setState(() {
                    _currIndex = _currIndex == 0 ? 1 : 0;
                  });
                },
              )
            ],
          ),
          body: Center(
            child: GestureDetector(
              onTap: () {
                context.read<AppThemeCubit>().toggleTheme();
                // moveToNextScreen(context, PetDetailsView.routeName);
              },
              child: Chip(
                label: Text(state.isDark.toString()),
              ),
            ),
          ), // Cente
        );
      },
    );
  }
}
