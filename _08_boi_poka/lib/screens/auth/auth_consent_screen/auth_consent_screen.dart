import 'dart:io';
import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/core/services/datasources/shared_preference_impl.dart';
import 'package:_08_boi_poka/core/utils/authentication_utils.dart';
import 'package:_08_boi_poka/screens/set_pattern_screen/widgets/custom_image_with_border.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

@RoutePage()
class AuthConsentScreen extends StatefulWidget {
  const AuthConsentScreen({super.key});

  @override
  State<AuthConsentScreen> createState() => _AuthConsentScreenState();
}

class _AuthConsentScreenState extends State<AuthConsentScreen> {
  bool isAuthenticated = false;
  final FingerprintUtils fingerprintUtils = FingerprintUtils();
  final sharedPref = SharedPrefController();
  final List<bool> authCheck = [false, false];

  @override
  Widget build(BuildContext context) {
    final cornerPokaImageSize = 300.w;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: -15.h,
            child: Image.asset(
              AppImages.leftTopCornerPoka,
              width: cornerPokaImageSize,
              height: cornerPokaImageSize,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  isAuthenticated = await fingerprintUtils.authWithBiometrics();
                  setState(() {
                    if (isAuthenticated) {
                      authCheck[0] = true;
                      sharedPref.storeBool("isBiometrics", true);
                    }
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageWithBorder(
                      androidImage: AppImages.fingerprint,
                      iosImage: AppImages.authFaceRecognition,
                      isSelected: authCheck[0],
                    ),
                    SizedBox(height: 9.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        Platform.isAndroid
                            ? 'enable biometrics'
                            : 'enable face Id',
                        style: AppTypography.typo12PrimaryTextRegular,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 21.h),
              GestureDetector(
                onTap: () async {
                  isAuthenticated = await fingerprintUtils.authWithPattern();
                  setState(() {
                    if (isAuthenticated) {
                      authCheck[1] = true;
                      sharedPref.storeBool("isPattern", true);
                    }
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImageWithBorder(
                      androidImage: AppImages.setPattern,
                      iosImage: AppImages.setPattern,
                      isSelected: authCheck[1],
                    ),
                    // Image.asset(
                    //   AppImages.authPatternRecognition,
                    //   width: recognitionImageSize,
                    //   height: recognitionImageSize,
                    //   fit: BoxFit.contain,
                    // ),
                    SizedBox(height: 9.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        Platform.isAndroid ? 'set pattern' : 'set pin',
                        style: AppTypography.typo12PrimaryTextRegular,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 33.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 95.w),
                child: AdaptiveButtonWidget(
                  disabled: !isAuthenticated,
                  iconImg: AppImages.allowIcon,
                  onTap:
                      isAuthenticated
                          ? () {
                            context.router.push(PageRouteInfo(AppRoutes.genre));
                          }
                          : () {},
                  title: "allow",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
