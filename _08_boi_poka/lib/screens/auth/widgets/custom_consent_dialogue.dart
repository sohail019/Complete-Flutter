import 'dart:developer';

import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

void referralConsentDialogView(BuildContext context, WidgetRef ref) async {
  try {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "Referral Consent Dialog",
      transitionDuration: const Duration(milliseconds: 650),
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.slowMiddle),
            ),
            child: AlertDialog(
              backgroundColor: AppColors.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'referral acceptance',
                          style: AppTypography.title20PrimaryTextBold,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'do you have a referral code?',
                          style: AppTypography.typo12PrimaryTextRegular,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AdaptiveButtonWidget(
                        disabled: false,
                        iconImg: AppImages.nextIcon,
                        onTap: () {
                          Navigator.pop(context); // Close the dialog
                          context.pushRoute(
                            PageRouteInfo(AppRoutes.authConsent),
                          );
                        },
                        title: "no",
                      ),
                      AdaptiveButtonWidget(
                        disabled: false,
                        iconImg: AppImages.registerIcon,
                        onTap: () {
                          Navigator.pop(context); // Close the dialog
                          context.pushRoute(
                            PageRouteInfo(AppRoutes.referralCode),
                          );
                        },
                        title: "yes",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  } catch (e) {
    log("Error in consent dialogue - $e");
  }
}
