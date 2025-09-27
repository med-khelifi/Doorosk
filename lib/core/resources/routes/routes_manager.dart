import 'package:doorosk/core/resources/routes/routes_names.dart';
import 'package:doorosk/views/home/home_screen.dart';
import 'package:doorosk/views/main/main_screen.dart';
import 'package:doorosk/views/onboarding/onboarding_screen.dart';
import 'package:doorosk/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static final routes = <String, WidgetBuilder>{
    RoutesNames.splash: (context) => const SplashScreen(),
    RoutesNames.onboarding: (context) => const OnboardingScreen(),
    RoutesNames.home: (context) => const HomeScreen(),
    RoutesNames.main: (context) => const MainScreen(),
  };
}