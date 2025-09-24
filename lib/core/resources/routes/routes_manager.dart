import 'package:doorosk/core/resources/routes/routes_names.dart';
import 'package:doorosk/views/onboardingd/onboarding_screen.dart';
import 'package:doorosk/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static final routes = <String, WidgetBuilder>{
    RoutesNames.onboarding: (context) => const SplashScreen(),
    RoutesNames.details: (context) => const OnboardingScreen(),
  };
}