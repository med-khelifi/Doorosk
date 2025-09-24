import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/images/images_manager.dart';
import 'package:doorosk/core/resources/routes/routes_names.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _topAnimation;
  late Animation<Offset> _downAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.pushReplacementNamed(context, RoutesNames.details);
            }
          });

    _topAnimation = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.fastOutSlowIn,
          ),
        );

    _downAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.fastOutSlowIn,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
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
                position: _topAnimation,
                child: Image.asset(ImagesManager.onboardingTop),
              ),
            ),
            
            Align(alignment: AlignmentGeometry.center ,child: Image.asset(ImagesManager.onboardingLogo)),
          
            Align(
              alignment: Alignment.bottomRight,
              child: SlideTransition(
                position: _downAnimation,
                child: Image.asset(ImagesManager.onboardingDown),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
