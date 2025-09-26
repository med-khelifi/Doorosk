import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircularShape extends StatelessWidget {
  const CustomCircularShape({super.key,this.withShadow = false, this.child});
  final bool withShadow;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      padding: EdgeInsets.all(9),
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        color: ColorsManager.blackColor,
        shadows: withShadow
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
