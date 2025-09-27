import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class LevelsTab extends StatelessWidget {
  const LevelsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Levels", style: TextStyle(color: ColorsManager.whiteColor)),
    );
  }
}
