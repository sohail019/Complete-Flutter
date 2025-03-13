import 'dart:io';

import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/screens/genre_screen/genre_screen.dart';
import 'package:_08_boi_poka/screens/set_pattern_screen/widgets/custom_image_with_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetPatternScreen extends StatefulWidget {
  const SetPatternScreen({super.key});

  @override
  State<SetPatternScreen> createState() => _SetPatternScreenState();
}

class _SetPatternScreenState extends State<SetPatternScreen> {
  bool isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,

      body: Stack(
        children: [
          Positioned(
            top: 38.w,
            left: 0,
            child: Image.asset(AppImages.setPatternWorm),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50.h),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageWithBorder(
                        androidImage: AppImages.faceId,
                        iosImage: AppImages.faceId,
                        isSelected: true,
                      ),
                      SizedBox(height: 9.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: AdaptiveButtonWidget(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    Platform.isAndroid
                                        ? "enable biometric?"
                                        : "enable face Id",
                                  ),
                                  content: Text(
                                    'do you want to enable ${Platform.isAndroid ? "biometric" : "face id"}?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('continue'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          title:
                              Platform.isAndroid
                                  ? "enable biometric?"
                                  : "enable face id",
                          disabled: false,
                          variant: "link",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 21.h),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageWithBorder(
                        androidImage: AppImages.setPattern,
                        iosImage: AppImages.setPattern,
                        isSelected: false,
                      ),
                      SizedBox(height: 9.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: AdaptiveButtonWidget(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    Platform.isAndroid
                                        ? "set pattern?"
                                        : "set pin",
                                  ),
                                  content: Text(
                                    'do you want to set ${Platform.isAndroid ? "pattern" : "pin"}?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('continue'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          title:
                              Platform.isAndroid ? "set pattern?" : "set pin",
                          disabled: false,
                          variant: "link",
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 33.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 95.w),
                  child: AdaptiveButtonWidget(
                    disabled: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GenreScreen()),
                      );
                    },
                    title: 'allow',
                    iconImg: AppImages.allowIcon,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
