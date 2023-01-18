import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pet_adoption_app/src/controllers/cubit/app_theme_cubit.dart';
import 'package:pet_adoption_app/src/views/history.dart';
import 'package:pet_adoption_app/src/views/home.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);
  static const String routeName = '/Root';

  static MaterialPageRoute getNavigator() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: "/Root"),
        builder: (c) {
          return BlocProvider(
              create: (context) => AppThemeCubit(), child: const Root());
        });
  }

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = [const HomeView(), const HistoryView()];
  final List<GButton> _tabsIcons = const [
    GButton(
      icon: LineIcons.home,
      text: 'Home',
    ),
    GButton(
      icon: LineIcons.history,
      text: 'History',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: _tabs.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 25),
            decoration: BoxDecoration(
              color: Colors.white,
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
                activeColor: Colors.black,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: _tabsIcons,
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
