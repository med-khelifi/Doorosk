import 'package:doorosk/core/models/level_model.dart';
import 'package:doorosk/views/main/appBarTabs/levels/widgets/level_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelsListView extends StatelessWidget {
  const LevelsListView({super.key, required this.modelsList});
  final List<LevelModel> modelsList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      clipBehavior: Clip.none,
      itemBuilder: (BuildContext context, int index) =>
          LevelDescription(model: modelsList[index]),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 30.h),
      itemCount: modelsList.length,
    );
  }
}
