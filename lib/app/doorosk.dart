import 'package:doorosk/core/resources/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Doorosk extends StatelessWidget {
  const Doorosk({super.key, required this.initialRoute});
  final String initialRoute;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        routes: RoutesManager.routes,
        initialRoute: initialRoute,
      ),
    );
  }
}
