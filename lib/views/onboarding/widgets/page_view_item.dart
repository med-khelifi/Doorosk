import 'package:doorosk/core/models/page_view_model.dart';
import 'package:doorosk/core/resources/fonts/fonts_names_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.pagerModel});
  final PagerViewModel pagerModel;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(pagerModel.imagePath),
          SizedBox(height: 50),
          Text(
            pagerModel.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontsNamesManager.aaaGalaxyFontName,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
