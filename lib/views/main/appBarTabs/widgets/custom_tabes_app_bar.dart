// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/fonts/fonts_names_manager.dart';

class CustomTabesAppBar extends StatelessWidget {
  const CustomTabesAppBar({
    Key? key,
    required this.onAddTap,
    required this.onSearchTap, required this.label,
  }) : super(key: key);
  final void Function() onAddTap;
  final void Function() onSearchTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 17.w),
        color: ColorsManager.primaryColor,
        height: 45.h,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontFamily: FontsNamesManager.geDinarOneFontName,
                fontSize: 15.sp,
                color: ColorsManager.whiteColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: onAddTap,
                  child: Icon(
                    Icons.add_circle_outline,
                    color: ColorsManager.whiteColor,
                  ),
                ),
                SizedBox(width: 5.w,),
                InkWell(
                  onTap: onSearchTap,
                  child: Icon(Icons.search, color: ColorsManager.whiteColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
