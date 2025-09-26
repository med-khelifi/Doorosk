import 'package:doorosk/core/resources/routes/routes_names.dart';
import 'package:flutter/material.dart';

class SplashScreenController {
  late AnimationController _animationController;
  late Animation<Offset> _topAnimation;
  late Animation<Offset> _downAnimation;
  get topAnimation => _topAnimation;
  get downAnimation => _downAnimation;

  late BuildContext _context;

  SplashScreenController({
    required TickerProvider vsync,
    required BuildContext context,
  }) {
    _context = context;
    _animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 3),
    );
    _animationController.addStatusListener(_animationListener);
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
  void _animationListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      goToOnboardingScreen();
    }
  }

  void goToOnboardingScreen() {
    Navigator.pushReplacementNamed(_context, RoutesNames.onboarding);
  }
  void dispose() {
    _animationController.dispose();
  }
}
