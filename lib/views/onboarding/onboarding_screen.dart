import 'package:doorosk/controllers/onboarding%20screen%20controller/onboarding_screen_controller.dart';
import 'package:doorosk/views/onboarding/widgets/custom_bottom_navigation_bar.dart';
import 'package:doorosk/views/onboarding/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late OnboardingScreenController _controller;
  @override
  void initState() {
    super.initState();
    _controller = OnboardingScreenController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        dotsCount: _controller.getPageViewItemsCount(),
        dotsPositionStream: _controller.dotsPositionStream,
        onNextPressed: _controller.onNextButtonPressed,
        onSkipPressed: _controller.onSkipButtonPressed,
        skipStartStream: _controller.nextStartStream,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: PageView.builder(
            controller: _controller.pageController,
            onPageChanged: _controller.onPageViewPageChanged,
            itemBuilder: (context, index) =>
                PageViewItem(pagerModel: _controller.getModelOf(index)),
            itemCount: _controller.getPageViewItemsCount(),
          ),
        ),
      ),
    );
  }
}
