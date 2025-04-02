import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterBottomBar extends StatelessWidget {
  final String title;
  final Function()? onTap;

  const FilterBottomBar({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait = orientation == Orientation.portrait;

    return Material(
      child: BottomAppBar(
        notchMargin: 10.0,
        elevation: 8,
        height: 60.h,
        color: AppColors.secondaryColor,
        padding: EdgeInsets.all(0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 0.5,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    // blurRadius: 3,
                    color: AppColors.trackBackgroundColor,
                    offset: Offset(0, -1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                color: AppColors.secondaryColor,
                width: double.infinity,
                height: screenHeight * 0.08,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    title,
                    style: AppTypography.typo16PrimaryTextBold,
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
