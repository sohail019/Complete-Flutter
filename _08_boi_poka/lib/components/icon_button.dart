import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SIconButton extends StatelessWidget {
  final IconData? icon;
  final String imgicon;
  final bool isSelected;
  final VoidCallback onTap;

  const SIconButton({
    super.key,
    this.icon,
    required this.imgicon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // final isTablet =
    //     View.of(context).physicalSize.shortestSide /
    //         View.of(context).devicePixelRatio >=
    //     680;
    // var orientation = MediaQuery.of(context).orientation;
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    // final isPortrait = orientation == Orientation.portrait;

    final iconSize = 0.05.sw;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(right: 2),
        padding: EdgeInsets.only(left: 0.04.sw),
        child: Column(
          children: [
            SizedBox(
              width: iconSize,
              child: Image.asset(
                imgicon,
                color: isSelected ? Colors.black : Colors.grey,
                height: iconSize,
                width: iconSize,
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              width: 20.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
