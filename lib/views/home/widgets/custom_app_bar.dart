import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/fonts/fonts_names_manager.dart';
import 'package:doorosk/core/resources/strings/strings_manager.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:TextDirection.rtl,
      child: AppBar(
        title: Text(
          StringsManager.homeScreenExploreApp,
          
          style: TextStyle(
            fontFamily: FontsNamesManager.geDinarOneFontName,
            fontSize: 25,
            color: ColorsManager.primaryColor,
          ),
        ),
        backgroundColor: ColorsManager.transparent,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
