import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class AttendanceTab extends StatelessWidget {
  const AttendanceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Attendance",
        style: TextStyle(color: ColorsManager.whiteColor),
      ),
    );
  }
}
