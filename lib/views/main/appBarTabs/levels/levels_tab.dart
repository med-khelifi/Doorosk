import 'package:doorosk/controllers/main%20sscreen%20controller/level_tab/level_tab_controller.dart';
import 'package:doorosk/core/resources/strings/strings_manager.dart';
import 'package:doorosk/views/main/appBarTabs/levels/widgets/levels_list_view.dart';
import 'package:doorosk/views/main/appBarTabs/widgets/custom_tabes_app_bar.dart';
import 'package:flutter/material.dart';

class LevelsTab extends StatefulWidget {
  const LevelsTab({super.key});

  @override
  State<LevelsTab> createState() => _LevelsTabState();
}

class _LevelsTabState extends State<LevelsTab> {
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
          onAddTap: () => _tabController.onAddLevelPressed(context),
          onSearchTap: _tabController.onSearchTapped,
          label: StringsManager.homeScreenLearningLevels,
        ),
        SizedBox(height: 10),
        Expanded(
          child: FutureBuilder(
            future: _tabController.getAllLevels(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("حدث خطأ أثناء تحميل المستويات"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text("لا توجد مستويات"));
              } else {
                return LevelsListView(modelsList: snapshot.data!);
              }
            },
          ),
        ),
      ],
    );
  }
}
