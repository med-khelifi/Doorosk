import 'dart:io';

import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/fonts/fonts_names_manager.dart';
import 'package:doorosk/core/resources/images/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LevelDescriptionContent extends StatelessWidget {
  const LevelDescriptionContent({
    super.key,
    required this.imagePath,
    required this.levelName,
    required this.levelDescription,
  });
  final String? imagePath;
  final String levelName;
  final String levelDescription;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      textDirection: TextDirection.rtl,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                levelName,
                style: TextStyle(
                  fontFamily: FontsNamesManager.geDinarOneFontName,
                  fontSize: 16.sp,
                  color: ColorsManager.whiteColor,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                levelDescription,
                textDirection: TextDirection.rtl,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontFamily: FontsNamesManager.geDinarOneFontName,
                  fontSize: 10.sp,
                  height: 1.4.h,
                  color: ColorsManager.lightGreyColorForText,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        CircleAvatar(
          radius: 30.r,
          child: imagePath == null
              ? SvgPicture.asset(
                  ImagesManager.placeholder,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                )
              : ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(30.r),
                  child: Image(
                    width: double.infinity,
                    height: double.infinity,
                    image: FileImage(File(imagePath!)),
                    fit: BoxFit.contain,
                  ),
                ),
        ),
      ],
    );
  }
}
