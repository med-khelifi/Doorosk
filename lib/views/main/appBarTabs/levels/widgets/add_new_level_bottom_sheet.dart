import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:doorosk/core/resources/fonts/fonts_names_manager.dart';
import 'package:doorosk/core/resources/images/images_manager.dart';
import 'package:doorosk/core/resources/strings/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewLevelBottomSheet {
  static void showAddNewLevelBottomSheet({
    required BuildContext context,
    required void Function() onAddLevelPressed,
    required void Function() onPicPressed,
    required TextEditingController levelNameTextController,
    required TextEditingController levelDescriptionTextController,
    required GlobalKey<FormState> formKey,
    String? Function(String?)? levelNameFieldValidator,
    String? Function(String?)? levelDescriptionFieldValidator,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(18.h),
          decoration: BoxDecoration(
            color: ColorsManager.lightGreyColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Form(
            key: formKey,
            child: Column(
              textDirection: TextDirection.rtl,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: levelNameFieldValidator,
                        controller: levelNameTextController,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: StringsManager.levelsTabEnterLevelName,
                          filled: true,
                          fillColor: ColorsManager.whiteColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: onPicPressed,
                      child: CircleAvatar(
                        radius: 25.sp,
                        backgroundImage: AssetImage(ImagesManager.placeholder),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                TextFormField(
                  validator: levelDescriptionFieldValidator,
                  controller: levelDescriptionTextController,
                  maxLines: 5,
                  minLines: 1,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: StringsManager.levelsTabEnterLevelDescription,
                    filled: true,
                    fillColor: ColorsManager.whiteColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                MaterialButton(
                  onPressed: onAddLevelPressed,
                  color: ColorsManager.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                  minWidth: 122.w,
                  height: 50.h,
                  child: Text(
                    StringsManager.add,
                    style: TextStyle(
                      color: ColorsManager.whiteColor,
                      fontFamily: FontsNamesManager.geDinarOneFontName,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
