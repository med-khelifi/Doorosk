import 'package:doorosk/core/resources/routes/routes_manager.dart';
import 'package:doorosk/core/resources/routes/routes_names.dart';
import 'package:flutter/material.dart';

class Doorosk extends StatelessWidget {
  const Doorosk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: RoutesManager.routes,
      initialRoute: RoutesNames.onboarding,
    );
  }
}