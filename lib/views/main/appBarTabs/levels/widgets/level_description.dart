import 'package:doorosk/core/models/level_model.dart';
import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/fonts/fonts_names_manager.dart';
import 'package:doorosk/views/home/widgets/custom_circular_shape.dart';
import 'package:doorosk/views/main/appBarTabs/levels/widgets/level_description_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LevelDescription extends StatelessWidget {
  const LevelDescription({
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
              title: Text("تأكيد الحذف"),
              content: Text("هل أنت متأكد أنك تريد حذف هذا العنصر؟"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(false), // إلغاء
                  child: Text("إلغاء"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                    deleteLevel(model);
                  }, // حذف
                  child: Text("حذف"),
                ),
              ],
            ),
          );
        }
        return false; // default
      },

      background: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        color: ColorsManager.redColor,
        child: Text(
          "حذف",
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
          "تعديل",
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
          right: 30,
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
              child: LevelDescriptionContent(
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
