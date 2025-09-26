// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doorosk/views/home/widgets/custom_square_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doorosk/core/models/page_view_model.dart';
import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/fonts/fonts_names_manager.dart';
import 'package:doorosk/views/home/widgets/custom_circular_shape.dart';

class CustomGridItem extends StatelessWidget {
  const CustomGridItem({Key? key, required this.model, required this.index});

  final PagerViewModel model;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: -15.h,
          left: -15.h,
          child: CustomCircularShape(withShadow: true),
        ),

        CustomSquareContent(model: model),
        Positioned(
          bottom: -15.h,
          left: -15.h,
          child: CustomCircularShape(
            child: Text(
              (index + 1).toString(),
              style: TextStyle(
                color: ColorsManager.whiteColor,
                fontFamily: FontsNamesManager.geDinarOneFontName,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
