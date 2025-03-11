import "package:_08_boi_poka/constants/app_colors.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:google_fonts/google_fonts.dart";

class AppTypography {
  //Play fair display titles start

  static TextStyle title10PrimaryTextRegular = GoogleFonts.playfairDisplay(
    fontSize: 10.sp,
    height: 1.33,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static TextStyle title40PrimaryTextBold = GoogleFonts.playfairDisplay(
    fontSize: 40.sp,
    height: 1,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static TextStyle title12PrimaryTextBold = GoogleFonts.playfairDisplay(
    fontSize: 12.sp,
    height: 3.33,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static TextStyle title12PrimaryTextRegular = GoogleFonts.playfairDisplay(
    fontSize: 12.sp,
    height: 1.25,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static TextStyle title12Height15PrimaryTextBold = GoogleFonts.playfairDisplay(
    fontSize: 12.sp,
    height: 1.5,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static TextStyle title18PrimaryTextRegular = GoogleFonts.playfairDisplay(
    fontSize: 18.sp,
    height: 1.5,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static TextStyle title40Height35PrimaryTextBold = GoogleFonts.playfairDisplay(
    fontSize: 40.sp,
    height: 0.875,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static TextStyle title40Height35PrimaryTextRegular =
      GoogleFonts.playfairDisplay(
        fontSize: 40.sp,
        height: 0.875,
        fontWeight: FontWeight.w400,
        color: AppColors.primaryTextColor,
      );

  static TextStyle title20PrimaryTextBold = GoogleFonts.playfairDisplay(
    fontSize: 20.sp,
    height: 1,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static TextStyle title20TertiaryTextBold = GoogleFonts.playfairDisplay(
    fontSize: 20.sp,
    height: 1,
    fontWeight: FontWeight.bold,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle title24PrimaryTextRegular = GoogleFonts.playfairDisplay(
    fontSize: 24.sp,
    height: 1.33,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static TextStyle title14PrimaryTextRegular = GoogleFonts.playfairDisplay(
    fontSize: 14.sp,
    height: 1.33,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static TextStyle title14PrimaryTextBold = GoogleFonts.playfairDisplay(
    fontSize: 14.sp,
    height: 1.33,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  //Play fair display titles ends

  //Quicksand typo starts

  static TextStyle typo6PrimaryTextBold = GoogleFonts.quicksand(
    fontSize: 6.sp,
    height: 3.33,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryColor,
  );

  static TextStyle typo8PrimaryTextBold = GoogleFonts.quicksand(
    fontSize: 8.sp,
    height: 3.33,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryColor,
  );

  static TextStyle typo8Height10PrimaryTextBold = GoogleFonts.quicksand(
    fontSize: 8.sp,
    // height: 1,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo8Height10PrimaryTextRegular = GoogleFonts.quicksand(
    fontSize: 8.sp,
    // height: 1,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo8Height10TertiaryTextRegular = GoogleFonts.quicksand(
    fontSize: 8.sp,
    // height: 1,
    fontWeight: FontWeight.w400,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle typo8Height10quadTextRegular = GoogleFonts.quicksand(
    fontSize: 8.sp,
    // height: 1,
    fontWeight: FontWeight.w400,
    color: AppColors.quadTextColor,
  );

  static TextStyle typo16PrimaryTextRegular = GoogleFonts.quicksand(
    fontSize: 16.sp,
    height: 1.25,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo16MediumTextRegular = GoogleFonts.quicksand(
    fontSize: 16.sp,
    height: 1.25,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo16PrimaryTextBold = GoogleFonts.quicksand(
    fontSize: 16.sp,
    height: 1.25,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo16TertiaryTextBold = GoogleFonts.quicksand(
    fontSize: 16.sp,
    height: 1.25,
    fontWeight: FontWeight.bold,
    color: AppColors.tertiaryTextColor,
  );

  //also we can use for button text
  static TextStyle typo14PrimaryTextBold = GoogleFonts.quicksand(
    fontSize: 14.sp,
    height: 1.25,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo14PrimaryTextRegular = GoogleFonts.quicksand(
    fontSize: 14.sp,
    height: 1.25,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo14TertiaryTextRegular = GoogleFonts.quicksand(
    fontSize: 14.sp,
    height: 1.25,
    fontWeight: FontWeight.w400,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle typo14TertiaryTextBold = GoogleFonts.quicksand(
    fontSize: 14.sp,
    height: 1.25,
    fontWeight: FontWeight.bold,
    color: AppColors.tertiaryTextColor,
  );

  //300
  static TextStyle typo12PrimaryTextLight = GoogleFonts.quicksand(
    fontSize: 12.sp,
    height: 1.25,
    fontWeight: FontWeight.w300,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo12ErrorTextRegular = GoogleFonts.quicksand(
    fontSize: 12.sp,
    height: 1.25,
    fontWeight: FontWeight.w400,
    color: AppColors.error,
  );

  //400
  static TextStyle typo12PrimaryTextRegular = GoogleFonts.quicksand(
    fontSize: 12.sp,
    height: 1.25,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo12PrimaryTextMedium = GoogleFonts.quicksand(
    fontSize: 12.sp,
    height: 1.25,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo12QuadTextRegular = GoogleFonts.quicksand(
    fontSize: 12.sp,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.quadTextColor,
  );

  static TextStyle typo8QuadTextRegular = GoogleFonts.quicksand(
    fontSize: 8.sp,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.quadTextColor,
  );

  static TextStyle typo8QuadTextprimary = GoogleFonts.quicksand(
    fontSize: 8.sp,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryColor,
  );

  static TextStyle typo10PrimaryTextRegular = GoogleFonts.quicksand(
    fontSize: 10.sp,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo10Height12PrimaryTextBold = GoogleFonts.quicksand(
    fontSize: 10.sp,
    height: 1.2,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo10Height12PrimaryTextSemiBold = GoogleFonts.quicksand(
    fontSize: 10.sp,
    height: 1.2,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo8TertiaryTextRegular = GoogleFonts.quicksand(
    fontSize: 8.sp,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle typo12TertiaryTextRegular = GoogleFonts.quicksand(
    fontSize: 12.sp,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle typo9TertiaryTextRegular = GoogleFonts.quicksand(
    fontSize: 9.sp,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle typo12TertiaryTextBold = GoogleFonts.quicksand(
    fontSize: 12.sp,
    height: 1.2,
    fontWeight: FontWeight.w700,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle typo7TertiaryTextMedium = GoogleFonts.quicksand(
    fontSize: 7.sp,
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle typo8TertiaryTextMedium = GoogleFonts.quicksand(
    fontSize: 8.sp,
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.tertiaryTextColor,
  );

  static TextStyle typo6TertiaryTextRegular = GoogleFonts.quicksand(
    fontSize: 6.sp,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.tertiaryTextColor,
  );

  //700
  static TextStyle typo12PrimaryTextBold = GoogleFonts.quicksand(
    fontSize: 12.sp,
    height: 1.25,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  //400 line height and font size is same = 12
  static TextStyle typo12Height12PrimaryTextRegular = GoogleFonts.quicksand(
    fontSize: 12.sp,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo12Height12PrimaryTextBold = GoogleFonts.quicksand(
    fontSize: 12.sp,
    height: 1,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo14Height12PrimaryTextRegular = GoogleFonts.quicksand(
    fontSize: 14.sp,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo14Height12PrimaryTextBold = GoogleFonts.quicksand(
    fontSize: 14.sp,
    height: 1,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo10PrimaryTextBold = GoogleFonts.quicksand(
    fontSize: 10.sp,
    height: 1.25,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo9PrimaryTextBold = GoogleFonts.quicksand(
    fontSize: 9.sp,
    height: 1.2,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo8PrimaryTextRegular = GoogleFonts.quicksand(
    fontSize: 8.sp,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo9PrimaryTextRegular = GoogleFonts.quicksand(
    fontSize: 9.sp,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo8PrimaryTextRegularUnderline = GoogleFonts.quicksand(
    fontSize: 8.sp,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
    decoration: TextDecoration.underline,
  );

  static TextStyle typo8PrimaryTextMedium = GoogleFonts.quicksand(
    fontSize: 8.sp,
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo7PrimaryTextMedium = GoogleFonts.quicksand(
    fontSize: 7.sp,
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryTextColor,
  );

  static TextStyle typo6PrimaryTextRegular = GoogleFonts.quicksand(
    fontSize: 6.sp,
    height: 1.25,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  //old
  static TextStyle typo30PrimaryBold = GoogleFonts.openSans(
    fontSize: 30.sp,
    height: 1.2,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static TextStyle typo11PrimaryBold = GoogleFonts.quicksand(
    fontSize: 11.sp,
    height: 1.2,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
}
