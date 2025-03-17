import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class TabButton extends StatelessWidget {
  final String? label;
  final VoidCallback onTap;
  final bool isActive;
  final String iconimg;

  const TabButton({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
    required this.iconimg,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    // var orientation = MediaQuery.of(context).orientation;
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    // final isPortrait = orientation == Orientation.portrait;

    final iconSize = isTablet ? 34.w : 38.w;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 15.w,
              height: 4.h,
              color: isActive ? AppColors.primaryColor : Colors.transparent,
            ),
            Spacer(),
            Image.asset(
              iconimg,
              color: isActive ? AppColors.primaryColor : Colors.grey,
              height: iconSize,
              width: iconSize,
              fit: BoxFit.contain,
            ),
            SizedBox(height: isTablet ? 3.h : 3.h),
            Text(
              label!,
              style:
                  isActive
                      ? AppTypography.typo8Height10PrimaryTextBold
                      : AppTypography.typo8Height10quadTextRegular,
            ),
            SizedBox(height: isTablet ? 8.h : 8.h),
          ],
        ),
      ),
    );
  }
}
