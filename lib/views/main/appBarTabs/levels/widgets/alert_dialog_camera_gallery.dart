import 'package:doorosk/core/resources/colors/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertDialogCameraGallery {
  static void showDialogChooseCameraOrGallery({
    required BuildContext context,
    required void Function() onCloseIconPressed,
    required void Function() onCameraIconPressed,
    required void Function() onGalleryIconPressed,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: IconButton.filled(
          onPressed: onCloseIconPressed,
          iconSize: 20.sp,
          icon: Icon(Icons.close_outlined),
          style: ElevatedButton.styleFrom(
            foregroundColor: ColorsManager.whiteColor,
            backgroundColor: ColorsManager.redColor,
            shape: CircleBorder(), 
          ),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton.filled(
              iconSize: 50.sp,
              style: ElevatedButton.styleFrom(),
              onPressed: onCameraIconPressed,
              icon: Icon(Icons.camera_alt_rounded),
            ),
            IconButton.filled(
              iconSize: 50.sp,
              style: ElevatedButton.styleFrom(),
              onPressed: onGalleryIconPressed,
              icon: Icon(Icons.image_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
