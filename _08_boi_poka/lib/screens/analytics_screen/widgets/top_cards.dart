import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class Topcards extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const Topcards({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 0.2.sw,
        decoration: BoxDecoration(
          // border: Border.all(color: AppColors.primaryColor, width: 1.w),
          color: color,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTypography.typo10PrimaryTextRegular),
              Spacer(),
              Text(value, style: AppTypography.title24PrimaryTextRegular),
            ],
          ),
        ),
      ),
    );
  }
}
