import 'dart:io';
import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class CustomImagePreviewDailogWidget extends StatelessWidget {
  final String? imageUrl;
  final File? uploadedFilePath;
  final Function() onPress;

  const CustomImagePreviewDailogWidget({
    this.imageUrl,
    this.uploadedFilePath,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "uploaded image preview",
                  style: AppTypography.title20PrimaryTextBold,
                ),
                SizedBox(height: 24.h),
                if (imageUrl != null)
                  Image.network(
                    imageUrl!,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Text("Book Image"));
                    },
                    width: 200.w,
                    height: 200.h,
                    fit: BoxFit.contain,
                  ),
                if (uploadedFilePath != null)
                  Image.file(
                    uploadedFilePath!,
                    width: 200.w,
                    height: 200.h,
                    fit: BoxFit.contain,
                  ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AdaptiveButtonWidget(
                iconImg: AppImages.moreIconHorizontal,
                disabled: false,
                onTap: () {
                  Navigator.pop(context);
                },
                title: "Cancel",
              ),
              AdaptiveButtonWidget(
                iconImg: AppImages.nextIcon,
                disabled: false,
                onTap: () {
                  onPress();
                  // NOTE Please dont use Navigator.pop(context); here as it losses the context for the loader.
                  // Navigator.pop(context);
                },
                title: "Continue",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
