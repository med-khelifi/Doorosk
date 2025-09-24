import 'package:doorosk/views/onboardingd/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemBuilder: (context, index) => PageViewItem(),
          itemCount: 2,
        ),
      ),
    );
  }
}
