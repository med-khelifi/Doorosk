import 'package:doorosk/core/const/home_screen_data.dart';
import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/views/home/widgets/custom_grid_item.dart';
import 'package:doorosk/views/home/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: ColorsManager.blackColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: GridView.builder(
            itemCount: 5,
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 30.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 46.w,
              crossAxisSpacing: 34.h,
            ),
            itemBuilder: (BuildContext context, int index) => CustomGridItem(
              model: HomeScreenData.pageViewData[index],
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
