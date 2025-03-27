import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class CustomSliderPaginationWidget extends StatelessWidget {
  final int currentIndex;
  final PageController pageController;
  final int itemLength;

  const CustomSliderPaginationWidget({
    super.key,
    required this.currentIndex,
    required this.pageController,
    required this.itemLength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemLength,
        (index) => GestureDetector(
          onTap: () {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            width: currentIndex == index ? 15.w : 6.w,
            height: 4.h,
            decoration: BoxDecoration(
              color:
                  currentIndex == index
                      ? AppColors.primaryColor
                      : AppColors.genreIconSeparator,
              borderRadius: BorderRadius.circular(0),
            ),
          ),
        ),
      ),
    );
  }
}
