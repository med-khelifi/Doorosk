import 'package:doorosk/core/models/page_view_model.dart';
import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/fonts/fonts_names_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSquareContent extends StatelessWidget {
  const CustomSquareContent({super.key, required this.model});
  final PagerViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 108.w,
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: ColorsManager.blackColor,
        border: Border.all(color: ColorsManager.primaryColor, width: 1.w),
        boxShadow: [
          BoxShadow(
            blurRadius: 10.r,
            blurStyle: BlurStyle.outer,
            color: ColorsManager.primaryColor,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30.h,
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: ColorsManager.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              model.title,
              style: TextStyle(
                color: ColorsManager.whiteColor,
                fontSize: 15.sp,
                fontFamily: FontsNamesManager.geDinarOneFontName,
              ),
            ),
          ),
          SvgPicture.asset(model.imagePath, height: 92.h),
        ],
      ),
    );
  }
}
