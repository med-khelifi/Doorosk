import 'package:doorosk/core/resources/routes/routes_names.dart';
import 'package:doorosk/views/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static final routes = <String, WidgetBuilder>{
    RoutesNames.onboarding: (context) => const OnBoardingScreen(),
    RoutesNames.details: (context) => const Placeholder(),
  };
}