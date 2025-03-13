import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryCardWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String libicon;
  final String text;
  final TextEditingController? controller;

  const LibraryCardWidget({
    super.key,
    required this.onTap,
    this.controller,
    required this.libicon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    // var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final isPortrait = orientation == Orientation.portrait;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 80.h,
        width: 110.w,
        child: Container(
          height: isTablet ? screenHeight * 0.13 : screenHeight * 0.11,
          width: screenWidth * 0.33,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color.fromRGBO(231, 231, 231, 1), //rgba(231, 231, 231, 1)
              width: 1,
            ),
          ),
          child: Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  libicon,
                  height: screenHeight * 0.050,
                  fit: BoxFit.cover,
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Text(
                    text,
                    style: AppTypography.typo11PrimaryBold,
                    textAlign: TextAlign.start,
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
