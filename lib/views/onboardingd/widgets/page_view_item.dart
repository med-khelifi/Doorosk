import 'package:doorosk/core/resources/images/images_manager.dart';
import 'package:doorosk/core/resources/strings/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: ColoredBox(color: Colors.red,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        SvgPicture.asset(ImagesManager.pagerViewImg1),
        Text(StringsManager.pagerViewTitle1,)
      ],),
    ));
  }
}
