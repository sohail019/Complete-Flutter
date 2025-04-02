import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/components/custom_fadeinup_animation.dart';
import 'package:_08_boi_poka/components/custom_textfield_widget.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/screens/auth/widgets/common_page_header_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class ReferralCodeScreen extends StatefulWidget {
  const ReferralCodeScreen({super.key});

  @override
  State<ReferralCodeScreen> createState() => _ReferralCodeScreenState();
}

class _ReferralCodeScreenState extends State<ReferralCodeScreen> {
  // final _facebookController = FacebookLoginController();
  // final _googleLoginController = GoogleLoginController();
  final _referralCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _referralCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonPageHeaderWidget(title: 'referral\ncode'),
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
                        validators: [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.password(),
                        ],
                        controller: _referralCodeController,
                        title: "referral code",
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
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: AdaptiveButtonWidget(
                    iconImg: AppImages.nextIcon,
                    disabled: false,
                    onTap: () async {
                      context.loaderOverlay.show();
                      // final innerCircleController = InnerCircleController();
                      // innerCircleController
                      //     .joinByReferral(
                      //       referralCode: _referralCodeController.text.trim(),
                      //     )
                      //     .then((value) {
                      //       context.loaderOverlay.hide();
                      //       var responseMap = value.response;
                      //       String message = "Joined Inner Circle By Referral";
                      //       if (responseMap.containsKey('message')) {
                      //         message = responseMap['message'];
                      //       }
                      //       try {
                      //         if (value.statusCode == 200) {
                      //           customSnackbarMsg(
                      //             textToShow: message,
                      //             durationInMilliseconds: 4000,
                      //             backgroundColor: Colors.green,
                      //             context: context,
                      //           );
                      //           context.pushRoute(
                      //             PageRouteInfo(AppRoutes.selectGenre),
                      //           );
                      //         }
                      //       } catch (e) {
                      //         context.loaderOverlay.hide();
                      //       }
                      //     })
                      //     .onError((error, stackTrace) {
                      //       context.loaderOverlay.hide();
                      //     });
                    },
                    title: "submit",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
