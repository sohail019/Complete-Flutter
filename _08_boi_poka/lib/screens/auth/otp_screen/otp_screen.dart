import 'dart:async';

import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/components/custom_loading_dialog_widget.dart';
import 'package:_08_boi_poka/components/custom_snackbar.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/controller/auth_remote_controller.dart';
import 'package:_08_boi_poka/core/services/datasources/shared_preference_impl.dart';
import 'package:_08_boi_poka/screens/auth/widgets/common_page_header_widget.dart';
import 'package:_08_boi_poka/screens/auth/widgets/custom_consent_dialogue.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class OtpScreen extends ConsumerStatefulWidget {
  final String phoneNum;
  final bool isPhoneNumAuthentication;
  final String otpType;

  const OtpScreen({
    super.key,
    required this.phoneNum,
    this.isPhoneNumAuthentication = false,
    required this.otpType,
  });

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final authRemoteController = AuthRemoteController();
  final TextEditingController _pinController = TextEditingController();
  Color errorTextColor = Colors.white;
  double errorFontSize = 15;

  final List<String> otp = ['', '', '', '']; //? To store OTP digits
  bool canResendOtp = false; // Resend OTP availability
  late Timer timer;
  int timeLeft = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  PinTheme getDefaultPinTheme(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double pinWidth = screenWidth * 0.15;
    return PinTheme(
      width: 38.h,
      height: 38.h, // Making height equal to width for square boxes
      textStyle: AppTypography.typo16PrimaryTextRegular,
      decoration: BoxDecoration(
        color: AppColors.tertiaryColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.transparent),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final isTablet =
    //     View.of(context).physicalSize.shortestSide /
    //         View.of(context).devicePixelRatio >=
    //     680;
    // var orientation = MediaQuery.of(context).orientation;
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    // final halfWormSize = screenWidth * 0.4;

    final defaultPinTheme = getDefaultPinTheme(context);
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonPageHeaderWidget(title: 'validate\notp'),
            Padding(
              padding: EdgeInsets.only(top: 52.h, left: 60.w, right: 60.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Pinput(
                      onCompleted: (value) {
                        final authRemoteController = AuthRemoteController();
                        customLoadingDialogWidget(context);
                        authRemoteController
                            .verifyOtp(
                              phoneNum: widget.phoneNum,
                              otp: value,
                              context: context,
                            )
                            .then((response) {
                              if (response.statusCode == 200 ||
                                  response.statusCode == 201) {
                                Navigator.pop(context);

                                customSnackbarMsg(
                                  textToShow: "OTP Verified!",
                                  durationInMilliseconds: 2000,
                                  backgroundColor: Colors.green,
                                  context: context,
                                );

                                if (widget.isPhoneNumAuthentication) {
                                  final sharedPref = SharedPrefController();
                                  sharedPref.storeBool("isVerified", true);
                                  sharedPref.storeBool("onBoarded", false);
                                  sharedPref.storeBool("isLogin", true);
                                  referralConsentDialogView(context, ref);
                                } else {
                                  // PageRouteInfo(
                                  // AppRoutes.updatedForgotPassword,
                                  // args: UpdatedForgotPasswordRouteArgs(
                                  //   phoneNum: widget.phoneNum,
                                  // ),
                                  // ),
                                }
                              }
                            })
                            .onError((error, stackTrace) {
                              Navigator.pop(context);
                              customSnackbarMsg(
                                textToShow: error.toString(),
                                durationInMilliseconds: 2000,
                                backgroundColor: Colors.red,
                                context: context,
                              );
                            });
                      },
                      length: 5,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      controller: _pinController,
                      errorTextStyle: TextStyle(
                        color: errorTextColor,
                        fontSize: errorFontSize,
                      ),
                      defaultPinTheme: defaultPinTheme,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        return null;
                      },
                      showCursor: false,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Column(
                    children: [
                      Text(
                        canResendOtp
                            ? ''
                            : 'Resend OTP in ${timeLeft ~/ 60}:${(timeLeft % 60).toString().padLeft(2, '0')}',
                        style: AppTypography.typo12PrimaryTextRegular,
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.w, right: 40.w),
              child: AdaptiveButtonWidget(
                iconImg: AppImages.registerIcon,
                onTap: canResendOtp ? resendOtp : () {},
                title: "resend otp",
                disabled: !canResendOtp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    timeLeft = 120;
    canResendOtp = false;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
        setState(() {
          canResendOtp = true;
        });
      }
    });
  }

  Future<void> resendOtp() async {
    try {
      context.loaderOverlay.show();
      final authRemoteController = AuthRemoteController();
      startTimer();
      setState(() {
        _pinController.clear();
      });

      var response = await authRemoteController.forgetPassword(
        phoneNum: widget.phoneNum,
        type: widget.otpType,
      );
      context.loaderOverlay.hide();
      if (response.statusCode == 200) {
        customSnackbarMsg(
          textToShow: "OTP Resent!",
          durationInMilliseconds: 2000,
          backgroundColor: Colors.blue,
          context: context,
        );
        return;
      }
      customSnackbarMsg(
        textToShow: "unable to send otp please try again in some time",
        durationInMilliseconds: 2000,
        backgroundColor: Colors.blue,
        context: context,
      );
    } catch (e) {
      context.loaderOverlay.hide();
      customSnackbarMsg(
        textToShow: "unable to send otp please try again in some time",
        durationInMilliseconds: 2000,
        backgroundColor: Colors.blue,
        context: context,
      );
    }
  }
}
