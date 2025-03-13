import 'dart:io';

import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageWithBorder extends StatelessWidget {
  final String androidImage;
  final String iosImage;
  final bool isSelected;
  const CustomImageWithBorder({
    required this.androidImage,
    required this.iosImage,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final recognitionImageSize = 150.w;
    return SizedBox(
      height: recognitionImageSize,
      width: recognitionImageSize,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 20,
            child: Image.asset(
              Platform.isAndroid ? androidImage : iosImage,
              width: 60.w,
              height: 80.h,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              height: 21.h,
              width: 24.w,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(width: 3, color: AppColors.imageBorder),
                  top: BorderSide(width: 3, color: AppColors.imageBorder),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 21.h,
              width: 24.w,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(width: 3, color: AppColors.imageBorder),
                  top: BorderSide(width: 3, color: AppColors.imageBorder),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 21.h,
              width: 24.w,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 3, color: AppColors.imageBorder),
                  right: BorderSide(width: 3, color: AppColors.imageBorder),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              height: 21.h,
              width: 24.w,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 3, color: AppColors.imageBorder),
                  left: BorderSide(width: 3, color: AppColors.imageBorder),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
