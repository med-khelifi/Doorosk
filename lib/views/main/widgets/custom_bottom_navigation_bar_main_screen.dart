import 'package:doorosk/core/models/app_bar_items_model.dart';
import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/fonts/fonts_names_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBarMainScreen extends StatelessWidget {
  const CustomBottomNavigationBarMainScreen({
    super.key,
    required this.selectedIndex,
    required this.onItemTap,
    required this.appBarModels,
  });
  final int selectedIndex;
  final Function(int) onItemTap;
  final List<AppBarItemsModel> appBarModels;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTap,
      items: [
        for (int i = 0; i < appBarModels.length; i++)
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              selectedIndex == i
                  ? appBarModels[i].activeImagePath
                  : appBarModels[i].inactiveImagePath,
              width: 24.w,
              height: 24.h,
              fit: BoxFit.contain,
            ),
            label: appBarModels[i].label,
          ),
      ],
      selectedItemColor: ColorsManager.primaryColor, // optional
      unselectedItemColor: ColorsManager.lightGreyColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontFamily: FontsNamesManager.geDinarOneFontName,
        fontSize: 10.sp,
        color: ColorsManager.primaryColor,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: FontsNamesManager.geDinarOneFontName,
        fontSize: 10.sp,
        color: ColorsManager.lightGreyColor,
      ),
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsManager.lightBlackColor,
    );
  }
}
