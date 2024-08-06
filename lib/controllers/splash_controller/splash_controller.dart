import 'dart:async';

import 'package:demo_project/utils/constants/string_constants.dart';
import 'package:get/get.dart';

import '../../shared_preferences_initialize.dart';
import '../../utils/app_routes.dart';
import '../../utils/constants/shared_preferences_key.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () {
      if (SharedPreferencesInitialize.getStringPrefValue(
              key: SharedPreferencesKey.authToken) !=
          StringConstants.empty) {
        Get.offAllNamed(AppRoutes.homeView);
      } else {
        Get.offAllNamed(AppRoutes.authenticationTab);
      }
    });
    super.onInit();
  }
}

class SplashControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
