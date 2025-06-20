import 'package:flutter/material.dart';
import 'package:simple_e_commerce_app/core/app_route/route_name.dart';
import 'package:simple_e_commerce_app/feature/auth/presentation/sign-in/sign-in.dart';
import 'package:simple_e_commerce_app/feature/auth/presentation/sign-up/sign-up.dart';
import 'package:simple_e_commerce_app/feature/home/presentation/screens/main-page.dart';
import 'package:simple_e_commerce_app/feature/on_boarding/presentation/screens/on-boardind-page.dart';
import 'package:simple_e_commerce_app/feature/splash/screens/splash-page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
        RouteNames.splashScreen: (context) => const SplashPage(),
        RouteNames.onBoardingScreen: (context) => const OnboardingPage(),
         RouteNames.signUpScreen: (context) => const RegisterPage(),
         RouteNames.signInScreen: (context) => const LoginPage(),
        RouteNames.homeScreen: (context) => const MainPage(),
      };
}
