import 'package:doorosk/controllers/splash%20screen%20controller/splash_screen_controller.dart';
import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/images/images_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late SplashScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SplashScreenController(context: context, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SlideTransition(
                position: _controller.topAnimation,
                child: Image.asset(ImagesManager.onboardingTop),
              ),
            ),

            Align(
              alignment: AlignmentGeometry.center,
              child: Image.asset(ImagesManager.onboardingLogo),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: SlideTransition(
                position: _controller.downAnimation,
                child: Image.asset(ImagesManager.onboardingDown),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
