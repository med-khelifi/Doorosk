import 'package:doorosk/controllers/main%20screen%20controller/level_tab/level_tab_controller.dart';
import 'package:doorosk/core/resources/strings/strings_manager.dart';
import 'package:doorosk/views/main/appBarTabs/widgets/custom_tabes_app_bar.dart';
import 'package:flutter/material.dart';

class GroupsTab extends StatefulWidget {
  const GroupsTab({super.key});

  @override
  State<GroupsTab> createState() => _LevelsTabState();
}

class _LevelsTabState extends State<GroupsTab> {
  late LevelTabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = LevelTabController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTabesAppBar(
          onAddTap: () {},
          onSearchTap: _tabController.onSearchTapped,
          label: StringsManager.homeScreenGroups,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
