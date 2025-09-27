import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class GroupsTab extends StatelessWidget {
  const GroupsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Groups",
        style: TextStyle(color: ColorsManager.whiteColor),
      ),
    );
  }
}
