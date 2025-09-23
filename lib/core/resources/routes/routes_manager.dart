import 'package:doorosk/core/resources/routes/routes_names.dart';
import 'package:doorosk/views/details/details_screen.dart';
import 'package:doorosk/views/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class RoutesManager {
  static final routes = <String, WidgetBuilder>{
    RoutesNames.onboarding: (context) => const OnboardingScreen(),
    RoutesNames.details: (context) => const DetailsScreen(),
  };
}