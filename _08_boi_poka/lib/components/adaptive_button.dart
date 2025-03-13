import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdaptiveButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String? title;
  final String? iconImg;
  final String? backgroundImage;
  final String? overlayImage;
  final int selectedGenreLen;
  final bool disabled;
  final String variant;
  final String? type;
  const AdaptiveButtonWidget({
    super.key,
    required this.onTap,
    this.title,
    this.iconImg,
    this.backgroundImage,
    this.overlayImage,
    this.selectedGenreLen = 0,
    this.disabled = true,
    this.variant = "default",
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final buttonHeight =
        screenHeight * 0.05; // Adjust proportionally (5% of screen height)
    // final buttonWidth =
    //     screenWidth * 0.1; // Adjust proportionally (10% of screen width)
    final iconSize =
        orientation == Orientation.portrait
            ? buttonHeight * 0.5
            : buttonHeight; // 50% of button height
    final borderThickness = 0.25.h;
    final iconButtonSize = screenWidth * 0.11;
    final iconButtonIconSize =
        screenWidth * 0.08; // Thickness relative to height

    if (backgroundImage != null && overlayImage != null) {
      return InkWell(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              height: iconButtonSize,
              width: iconButtonSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(backgroundImage!),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              child: Image.asset(
                overlayImage!,
                height: iconButtonIconSize,
                width: iconButtonIconSize,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );
    } else if (variant == "link") {
      return Opacity(
        opacity: disabled ? 0.4 : 1,
        child: InkWell(
          onTap: onTap,
          child: Text(
            title ?? "",
            textAlign: TextAlign.start,
            style:
                type == "large"
                    ? AppTypography.typo12PrimaryTextRegular.copyWith()
                    : type == "textBold"
                    ? AppTypography.typo12PrimaryTextBold.copyWith()
                    : AppTypography.typo12PrimaryTextRegular.copyWith(),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Opacity(
              opacity: disabled ? 0.4 : 1,
              child: Container(
                color: AppColors.secondaryColor,
                padding: EdgeInsets.all(1),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (iconImg != null)
                        Image.asset(
                          iconImg!,
                          color: AppColors.primaryColor,
                          height: iconSize,
                          width: iconSize,
                          fit: BoxFit.contain,
                        ),
                      SizedBox(width: 6.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 58.w,
                            height: borderThickness,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(height: isTablet ? 3.h : 0),
                          Text(
                            title ?? "",
                            textAlign: TextAlign.start,
                            style:
                                AppTypography.typo14PrimaryTextBold.copyWith(),
                          ),
                          SizedBox(height: isTablet ? 5.h : 3.h),
                          Container(
                            width: 58.w,
                            height: borderThickness,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
