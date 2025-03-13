import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/components/custom_slider_widget.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/screens/onboarding/lib_screen/lib_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ScaleScreen extends StatefulWidget {
  const ScaleScreen({super.key});

  @override
  State<ScaleScreen> createState() => _ScaleScreenState();
}

class _ScaleScreenState extends State<ScaleScreen> {
  Map<String, dynamic> interests = {
    "physical": 80.0,
    "ebook": 40.0,
    "audioBook": 60.0,
  };

  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    // var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    // final isPortrait = orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Stack(
        children: [
          Positioned(
            left: 0,
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
                  left: isTablet ? 65.w : 75.w,
                  right: isTablet ? 20.w : 30.w,
                  top: isTablet ? 105.h : 120.h,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  children: [
                    CustomSliderWidget(
                      bookId: "physical",
                      title: "Physical Books",
                      value: interests["physical"],
                      onChanged: (value) {
                        setState(() {
                          interests["physical"] = value;
                        });
                      },
                      thumbColor: AppColors.pallete1,
                    ),
                    SizedBox(height: 36.h),
                    CustomSliderWidget(
                      bookId: "ebook",
                      title: "E-Books",
                      value: interests["ebook"],
                      onChanged: (value) {
                        setState(() {
                          interests["ebook"] = value;
                        });
                      },
                      thumbColor: AppColors.pallete2,
                    ),
                    SizedBox(height: 36.h),
                    CustomSliderWidget(
                      bookId: "audio",
                      title: "Audio Books",
                      value: interests["audioBook"],
                      onChanged: (value) {
                        setState(() {
                          interests["audioBook"] = value;
                        });
                      },
                      thumbColor: AppColors.pallete3,
                    ),
                    SizedBox(height: 36.h),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: AdaptiveButtonWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LibScreen()),
                    );
                  },
                  title: "next",
                  disabled: false,
                  iconImg: AppImages.nextIcon,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
