import 'package:demo_project/controllers/splash_controller/splash_controller.dart';
import 'package:demo_project/shared_preferences_initialize.dart';
import 'package:demo_project/utils/app_routes.dart';
import 'package:demo_project/utils/app_theme.dart';
import 'package:demo_project/utils/app_utils.dart';
import 'package:demo_project/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'extension/sized_box_extension.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesInitialize
      .initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: AppRoutes.splashView,
      initialBinding: SplashControllerBinding(),
      title: 'DEMO',
      getPages: appPages,
      debugShowCheckedModeBanner: isFalse,
      theme: appTheme.getLightTheme,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              boldText: isFalse,
              alwaysUse24HourFormat: isFalse, // 24 hour clock mode off
              textScaler: MediaQuery.of(context)
                  .textScaler
                  .clamp(minScaleFactor: 0.8, maxScaleFactor: 1)),
          child: child ?? emptySpace(),
        );
      },
    );
  }
}
