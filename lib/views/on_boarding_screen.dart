import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/images/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child:Image(image: AssetImage(ImagesManager.onboardingTop ))
            ),
            Center(
              child:Image(image: AssetImage(ImagesManager.onboardingLogo))
            ),
            Align(
              alignment: Alignment.bottomRight,
              child:Image(image: AssetImage(ImagesManager.onboardingDown))
            ),
          ],
        )
      )
    );
  }
}
