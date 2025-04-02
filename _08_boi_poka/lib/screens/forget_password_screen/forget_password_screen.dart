import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/components/custom_fadeinup_animation.dart';
import 'package:_08_boi_poka/components/custom_textfield_widget.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/controller/auth_remote_controller.dart';
import 'package:_08_boi_poka/navigation/app_router.gr.dart';
import 'package:_08_boi_poka/screens/auth/widgets/common_page_header_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final authRemoteController = AuthRemoteController();

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final mobileRegex = RegExp(r'^\d{10}$');
  final _emailAndMobileNumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonPageHeaderWidget(title: 'forgot\npass'),
            Padding(
              padding: EdgeInsets.only(top: 52.h, left: 60.w, right: 60.w),
              child: Column(
                children: [
                  CustomFadeinupAnimation(
                    delay: 350,
                    animationDuration: 300,
                    slideOffsetDistance: 0.15,
                    child: CustomTextfield(
                      onChangeCallback: () {
                        setState(() {});
                      },
                      validators: [FormBuilderValidators.required()],
                      controller: _emailAndMobileNumController,
                      title: "phone number",
                      maxLength: 10,
                      isOnlyNumber: true,
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
            CustomFadeinupAnimation(
              delay: 400,
              animationDuration: 300,
              slideOffsetDistance: 0.15,
              child: Padding(
                padding: EdgeInsets.only(left: 40.w, right: 40.w),
                child: AdaptiveButtonWidget(
                  disabled:
                      !(_emailAndMobileNumController.text.trim().isNotEmpty),
                  iconImg: AppImages.nextIcon,
                  onTap:
                      (_emailAndMobileNumController.text.trim().isNotEmpty)
                          ? () async {
                            //? if input value is not a valid mobile number
                            if (!mobileRegex.hasMatch(
                              _emailAndMobileNumController.text.trim(),
                            )) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'please enter a valid mobile number',
                                  ),
                                ),
                              );
                              return;
                            }
                            context.loaderOverlay.show();
                            try {
                              authRemoteController
                                  .forgetPassword(
                                    phoneNum:
                                        _emailAndMobileNumController.text
                                            .trim(),
                                    type: 'forgot',
                                  )
                                  .then((response) {
                                    context.loaderOverlay.hide();
                                    if (response.statusCode == 200 ||
                                        response.statusCode == 201) {
                                      context.pushRoute(
                                        PageRouteInfo(
                                          AppRoutes.otp,
                                          args: OtpRouteArgs(
                                            phoneNum:
                                                _emailAndMobileNumController
                                                    .text
                                                    .trim(),
                                            otpType: 'forgot',
                                          ),
                                        ),
                                      );
                                    }
                                  })
                                  .onError((error, stackTrace) {
                                    context.loaderOverlay.hide();
                                  });
                            } catch (e) {}
                          }
                          : () {},
                  title: "send verification code",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
