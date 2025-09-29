// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doorosk/core/resources/colors/colors_manager.dart';

class CustomCircularShape extends StatelessWidget {
  const CustomCircularShape({
    Key? key,
    this.withShadow = false,
    this.child,
    this.heigh = 40,
    this.width = 40,
  }) : super(key: key);
  final bool? withShadow;
  final Widget? child;
  final double heigh;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heigh.h,
      width: width.w,
      padding: EdgeInsets.all(9),
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        color: ColorsManager.blackColor,
        shadows: withShadow ?? false
            ? [
                BoxShadow(
                  blurRadius: 10.r,
                  blurStyle: BlurStyle.outer,
                  color: ColorsManager.primaryColor,
                ),
              ]
            : null,
      ),
      child: CircleAvatar(
        backgroundColor: ColorsManager.primaryColor,
        child: child,
      ),
    );
  }
}
