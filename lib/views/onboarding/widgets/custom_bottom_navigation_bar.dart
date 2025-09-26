import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/fonts/fonts_names_manager.dart';
import 'package:doorosk/core/resources/strings/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onNextPressed,
    required this.onSkipPressed,
    required this.dotsCount,
    required this.dotsPositionStream,
    required this.skipStartStream,
  });
  final VoidCallback onNextPressed;
  final VoidCallback onSkipPressed;
  final int dotsCount;
  final Stream<double> dotsPositionStream;
  final Stream<bool> skipStartStream;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 2.w),
      height: 50.h,
      color: ColorsManager.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: onSkipPressed,
            child: Text(
              StringsManager.skip,
              style: TextStyle(
                fontFamily: FontsNamesManager.geDinarOneFontName,
                fontSize: 16.sp,
                color: ColorsManager.whiteColor,
              ),
            ),
          ),
          StreamBuilder<double>(
            stream: dotsPositionStream,
            builder: (context, asyncSnapshot) {
              return DotsIndicator(
                dotsCount: dotsCount,
                position: !asyncSnapshot.hasData ? 0 : asyncSnapshot.data!,
                decorator: DotsDecorator(
                  activeColor: ColorsManager.whiteColor,
                  color: ColorsManager.whiteColor30Opacity,
                  spacing: EdgeInsets.all(4),
                  size: Size(10, 10)
                ),
              );
            },
          ),
          StreamBuilder<bool>(
            stream: skipStartStream,
            builder: (context, asyncSnapshot) {
              return TextButton(
                onPressed: onNextPressed,
                child: Text(
                  !asyncSnapshot.hasData || !asyncSnapshot.data!
                      ? StringsManager.next
                      : StringsManager.start,
                  style: TextStyle(
                    fontFamily: FontsNamesManager.geDinarOneFontName,
                    fontSize: 16.sp,
                    color: ColorsManager.whiteColor,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
