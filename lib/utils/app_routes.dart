import 'package:demo_project/controllers/authentication_controller/sign_in_controller.dart';
import 'package:demo_project/controllers/splash_controller/splash_controller.dart';
import 'package:demo_project/views/authentication_views/authentication_tab.dart';
import 'package:demo_project/views/splash_view/splash_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../controllers/authentication_controller/sign_up_controller.dart';
import '../controllers/home_controller/home_controller.dart';
import '../views/home_view/home_view.dart';
import 'app_utils.dart';

abstract class AppRoutes {
  static const splashView = '/';
  static const authenticationTab = '/authentication-tab';

  //home up related route
  static const homeView = '/home-view';
}

// APP PAGES
final appPages = [
  GetPage(
      name: AppRoutes.splashView,
      page: () => const SplashView(),
      transition: Transition.fadeIn,
      transitionDuration: navigatorAnimationDuration,
      binding: SplashControllerBinding()),

  GetPage(
      name: AppRoutes.authenticationTab,
      page: () => const AuthenticationTab(),
      transition: Transition.fadeIn,
      transitionDuration: navigatorAnimationDuration,
      bindings: [SignInControllerBinding(), SignUpControllerBinding()]),

  //Home related page
  GetPage(
      name: AppRoutes.homeView,
      page: () => const HomeView(),
      transitionDuration: navigatorAnimationDuration,
      bindings: [HomeControllerBinding()],
      transition: Transition.fadeIn),
];
