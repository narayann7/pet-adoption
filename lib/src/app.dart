import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_adoption_app/src/controllers/cubit/app_theme_cubit.dart';
import 'package:pet_adoption_app/src/utils/coustom_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static Future myAppInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppThemeCubit(),
        ),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) => MaterialApp(
          title: 'Pet Adoption App',
          debugShowCheckedModeBanner: false,
          theme: state.currentTheme,
          initialRoute: "/",
          onGenerateRoute: CustomRoutes.generateRoute,
        ),
      ),
    );
  }
}
