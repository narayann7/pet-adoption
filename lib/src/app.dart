import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pet_adoption_app/src/controllers/global_cubit/app_global_cubit.dart';
import 'package:pet_adoption_app/src/utils/coustom_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/src/views/root.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.isDark});
  final bool? isDark;
  static Future myAppInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory path = await getApplicationSupportDirectory();
    Hive.init(path.path);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return AppGlobalCubit(AppGlobalState.initial(isDark: isDark as bool));
        })
      ],
      child: BlocBuilder<AppGlobalCubit, AppGlobalState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Pet Adoption App',
            debugShowCheckedModeBanner: false,
            theme: state.currentTheme,
            home: const Root(),
            onGenerateRoute: CustomRoutes.generateRoute,
          );
        },
      ),
    );
  }
}
