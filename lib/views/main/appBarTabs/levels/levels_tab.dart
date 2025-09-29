import 'package:doorosk/core/resources/strings/strings_manager.dart';
import 'package:doorosk/views/main/appBarTabs/levels/widgets/levels_list_view.dart';
import 'package:doorosk/views/main/appBarTabs/widgets/custom_tabes_app_bar.dart';
import 'package:flutter/material.dart';

class LevelsTab extends StatelessWidget {
  const LevelsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTabesAppBar(
          onAddTap: () {},
          onSearchTap: () {},
          label: StringsManager.homeScreenLearningLevels,
        ),
        SizedBox(height: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: LevelsListView(),
          ),
        ),
      ],
    );
  }
}
