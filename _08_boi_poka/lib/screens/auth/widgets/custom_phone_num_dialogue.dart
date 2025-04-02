import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/components/custom_loading_dialog_widget.dart';
import 'package:_08_boi_poka/components/custom_snackbar.dart';
import 'package:_08_boi_poka/components/custom_textfield_widget.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/controller/auth_remote_controller.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

Future<void> customPhoneNumberDialogue(
  BuildContext context,
  String? phoneNumber,
) async {
  final controller = TextEditingController();
  if (phoneNumber != null && phoneNumber.isNotEmpty) {
    controller.text = phoneNumber;
  }
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
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
                    vertical: 10.h,
                    horizontal: 20.w,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Verify your contact number ",
                        style: AppTypography.title20PrimaryTextBold,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextfield(
                        onChangeCallback: () {},
                        controller: controller,
                        title: "Enter Phone Number",
                        validators: [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.phoneNumber(),
                        ],
                        isOnlyNumber: true,
                      ),
                      SizedBox(height: 8.h),

                      Text(
                        "We will send you a verification code",
                        style: AppTypography.typo12PrimaryTextRegular,
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
                AdaptiveButtonWidget(
                  onTap: () async {
                    final authController = AuthRemoteController();
                    String phoneNumber = controller.text.trim();
                    if (phoneNumber.isNotEmpty) {
                      customLoadingDialogWidget(context);
                      await authController
                          .forgetPassword(
                            phoneNum: phoneNumber,
                            type: "register",
                          )
                          .then((value) {
                            Navigator.pop(context);

                            if (value.statusCode == 200 ||
                                value.statusCode == 201) {
                              customSnackbarMsg(
                                textToShow: "OTP Sent Successfully",
                                durationInMilliseconds: 3000,
                                context: context,
                              );
                              // context.pushRoute(PageRouteInfo(AppRoutes.otp, arf))
                            }
                          })
                          .onError((error, stackTrace) {
                            Navigator.pop(context);
                            customSnackbarMsg(
                              textToShow: error.toString(),
                              durationInMilliseconds: 3000,
                              context: context,
                            );
                          });
                    }
                  },
                  iconImg: AppImages.moreIconHorizontal,
                  disabled: false,
                  title: "Send Verification Code",
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
