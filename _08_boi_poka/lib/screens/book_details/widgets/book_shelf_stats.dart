import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class BookShelfStats extends StatelessWidget {
  final int count;
  final String title;
  final String imagePath;

  const BookShelfStats({
    super.key,
    required this.count,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = 12.w;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imagePath,
          width: iconSize,
          height: iconSize,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            Text("$count", style: AppTypography.typo12PrimaryTextBold),
            SizedBox(width: 5.w),
            Text(title, style: AppTypography.typo12PrimaryTextRegular),
          ],
        ),
      ],
    );
  }
}
