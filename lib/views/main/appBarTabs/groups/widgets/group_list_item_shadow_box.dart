import 'package:doorosk/core/models/level_model.dart';
import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/fonts/fonts_names_manager.dart';
import 'package:doorosk/core/resources/strings/strings_manager.dart';
import 'package:doorosk/views/home/widgets/custom_circular_shape.dart';
import 'package:doorosk/views/main/appBarTabs/groups/widgets/group_description_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupListItemShadowBox extends StatelessWidget {
  const GroupListItemShadowBox({
    super.key,
    required this.model,
    required this.deleteLevel,
    required this.editLevel,
  });
  final LevelModel model;
  final void Function(LevelModel level) deleteLevel;
  final void Function(LevelModel level) editLevel;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(model.levelId),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          // delete
          editLevel(model);
        } else if (direction == DismissDirection.startToEnd) {
          return await showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text(
                StringsManager.confirmDeletion,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: ColorsManager.blackColor,
                  fontFamily: FontsNamesManager.geDinarOneFontName,
                  fontSize: 15.sp,
                ),
              ),
              content: Text(
                StringsManager.areUSureToDeleteThisItem,
                style: TextStyle(
                  color: ColorsManager.blackColor,
                  fontFamily: FontsNamesManager.geDinarOneFontName,
                  fontSize: 15.sp,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(false),
                  child: Text(
                    StringsManager.cancel,
                    style: TextStyle(
                      color: ColorsManager.blackColor,
                      fontFamily: FontsNamesManager.geDinarOneFontName,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                    deleteLevel(model);
                  },
                  child: Text(
                    StringsManager.delete,
                    style: TextStyle(
                      color: ColorsManager.blackColor,
                      fontFamily: FontsNamesManager.geDinarOneFontName,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return false;
      },
      background: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        color: ColorsManager.redColor,
        child: Text(
          StringsManager.delete,
          style: TextStyle(
            color: ColorsManager.whiteColor,
            fontFamily: FontsNamesManager.geDinarOneFontName,
            fontSize: 20.sp,
          ),
        ),
      ),
      secondaryBackground: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.centerRight,
        color: ColorsManager.greenColor,
        child: Text(
          StringsManager.edit,
          style: TextStyle(
            color: ColorsManager.whiteColor,
            fontFamily: FontsNamesManager.geDinarOneFontName,
            fontSize: 20.sp,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          left: 10,
          top: 20,
          right: 20,
        ),
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
                border: Border.all(
                  color: ColorsManager.primaryColor,
                  width: 1.w,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10.r,
                    blurStyle: BlurStyle.outer,
                    color: ColorsManager.primaryColor,
                  ),
                ],
              ),
              child: GroupDescriptionContent(
                imagePath: model.imagePath,
                levelName: model.title,
                levelDescription: model.description,
                createdAt: model.createdAt ?? "--------",
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
      ),
    );
  }
}
