import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class StudentsTab extends StatelessWidget {
  const StudentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Students",
        style: TextStyle(color: ColorsManager.whiteColor),
      ),
    );
  }
}
