import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pet_adoption_app/src/controllers/global_cubit/app_global_cubit.dart';
import 'package:pet_adoption_app/src/controllers/pets_cubit/pets_cubit.dart';
import 'package:pet_adoption_app/src/views/history.dart';
import 'package:pet_adoption_app/src/views/home.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);
  static const String routeName = '/';

  static MaterialPageRoute getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/"),
        builder: (c) {
          return BlocProvider(
              create: (context) => PetsCubit(), child: const Root());
        });
  }

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final List<Widget> _tabs = [const HomeView(), const HistoryView()];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PetsCubit>().getHistoryDataFromHive();
      context.read<PetsCubit>().getDataFromApi();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppGlobalCubit, AppGlobalState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).backgroundColor,
          body: Center(
            child: _tabs.elementAt(state.buttomNavIndex),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 25),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 55.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Theme.of(context).cardColor,
                color: Theme.of(context).textTheme.headline1!.color!,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                    textColor: Theme.of(context).textTheme.headline1!.color!,
                    iconColor: Theme.of(context).textTheme.headline1!.color!,
                  ),
                  GButton(
                    icon: LineIcons.history,
                    text: 'History',
                    textColor: Theme.of(context).textTheme.headline1!.color!,
                    iconColor: Theme.of(context).textTheme.headline1!.color!,
                  ),
                ],
                selectedIndex: state.buttomNavIndex,
                onTabChange: (index) {
                  context.read<AppGlobalCubit>().changeBottomNavIndex(index);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
