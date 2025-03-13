import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibScreen extends StatelessWidget {
  const LibScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 10.w,
              top: isTablet ? -0.05.sh : 0,
              child: Image.asset(
                AppImages.bouncyPoka,
                width: isTablet ? 0.9.sw : screenWidth,
                fit: BoxFit.contain,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: isTablet ? 65.w : 70.w,
                    right: isTablet ? 20.w : 30.w,
                    top: isTablet ? 105.h : 115.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "welcome",
                        style: AppTypography.title40PrimaryTextBold,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "On the Scale of 1-10 you enjoy...",
                        style: AppTypography.typo16PrimaryTextRegular,
                      ),
                      SizedBox(height: 26.h),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
