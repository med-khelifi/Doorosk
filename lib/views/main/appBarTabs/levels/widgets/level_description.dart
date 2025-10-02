import 'package:doorosk/core/models/level_model.dart';
import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/fonts/fonts_names_manager.dart';
import 'package:doorosk/views/home/widgets/custom_circular_shape.dart';
import 'package:doorosk/views/main/appBarTabs/levels/widgets/level_description_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelDescription extends StatelessWidget {
  const LevelDescription({super.key, required this.model});
  final LevelModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -15,
            right: -15,
            child: CustomCircularShape(withShadow: true),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 6.w),
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
            child: LevelDescriptionContent(
              imagePath: model.imagePath,
              levelName: model.title,
              levelDescription: model.description,
            ),
          ),
          Positioned(
            top: -15,
            right: -15,
            child: CustomCircularShape(
              child: Text(
                model.levelId.toString(),
                style: TextStyle(
                  color: ColorsManager.whiteColor,
                  fontFamily: FontsNamesManager.geDinarOneFontName,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
