import 'package:doorosk/controllers/main%20screen%20controller/level_tab/level_tab_controller.dart';
import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/fonts/fonts_names_manager.dart';
import 'package:doorosk/core/resources/strings/strings_manager.dart';
import 'package:doorosk/views/main/appBarTabs/groups/widgets/groups_list_view.dart';
import 'package:doorosk/views/main/appBarTabs/widgets/custom_tabes_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                return Center(
                  child: Text(
                    StringsManager.errorsWhileFetchingLevels,
                    style: TextStyle(
                      color: ColorsManager.whiteColor,
                      fontFamily: FontsNamesManager.geDinarOneFontName,
                      fontSize: 15.sp,
                    ),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text(
                    StringsManager.noLevels,
                    style: TextStyle(
                      color: ColorsManager.whiteColor,
                      fontFamily: FontsNamesManager.geDinarOneFontName,
                      fontSize: 15.sp,
                    ),
                  ),
                );
              } else {
                return GroupsListView(
                  modelsList: snapshot.data!,
                  deleteLevel: _tabController.softDeleteEducationLevel,
                  editLevel: _tabController.editEducationLevel,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
