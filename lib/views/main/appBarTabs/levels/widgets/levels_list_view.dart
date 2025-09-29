import 'package:doorosk/core/resources/images/images_manager.dart';
import 'package:doorosk/views/main/appBarTabs/levels/widgets/level_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelsListView extends StatelessWidget {
  const LevelsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      clipBehavior: Clip.none,
      itemBuilder: (BuildContext context, int index) => LevelDescription(
        imagePath: ImagesManager.test,
        levelName: 'الصف الأول الإعدادي',
        levelDescription:
            'تلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلاتلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلاتلك الصف هو الصف الاعدادي وفي ثلاث طلاب مثلا',
        index: index,
      ),
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 30.h),
      itemCount: 3,
    );
  }
}
