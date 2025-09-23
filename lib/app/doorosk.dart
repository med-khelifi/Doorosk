import 'package:doorosk/core/resources/routes/routes_manager.dart';
import 'package:flutter/material.dart';

class Doorosk extends StatelessWidget {
  const Doorosk({super.key, required this.initialRoute});
  final String initialRoute;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: RoutesManager.routes,
      initialRoute: initialRoute,
    );
  }
}
