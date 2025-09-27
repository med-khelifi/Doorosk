import 'package:doorosk/core/const/home_screen_data.dart';
import 'package:doorosk/views/home/widgets/custom_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridView extends StatelessWidget {
  CustomGridView({super.key, required this.onItemTap});
  late Function(int index) onItemTap;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 5,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 30.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 46.w,
        crossAxisSpacing: 34.h,
        childAspectRatio: 100.w / 108.h,
      ),
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () => onItemTap(index),
        child: CustomGridItem(
          model: HomeScreenData.pageViewData[index],
          index: index,
        ),
      ),
    );
  }
}
