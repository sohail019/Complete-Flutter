import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/components/custom_textfield_widget.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/controller/auth_remote_controller.dart';
import 'package:_08_boi_poka/controller/google_login_controller.dart';
import 'package:_08_boi_poka/core/utils/session_manager.dart';
import 'package:_08_boi_poka/navigation/app_router.gr.dart';
import 'package:_08_boi_poka/screens/auth/widgets/common_page_header_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

@RoutePage()
class SigninScreen extends ConsumerStatefulWidget {
  final String? errorMessage;
  final bool isLogout;

  const SigninScreen({super.key, this.errorMessage, this.isLogout = false});

  @override
  SigninScreenState createState() => SigninScreenState();
}

class SigninScreenState extends ConsumerState<SigninScreen> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final mobileRegex = RegExp(r'^\d{10}$');
  final _emailAndMobileNumController = TextEditingController();
  final _passwordController = TextEditingController();

  final _googleLoginController = GoogleLoginController();
  final AuthRemoteController _authRemoteController = AuthRemoteController();

  @override
  void dispose() {
    _emailAndMobileNumController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.errorMessage != null) {
      Future.delayed(Duration(seconds: 2), () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.errorMessage!),
            backgroundColor: Colors.red,
          ),
        );
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonPageHeaderWidget(title: "Sign in to \nBoiPoka"),

              Padding(
                padding: EdgeInsets.only(
                  top: 52.h,
                  left: 60.w,
                  right: 60.w,
                  bottom: 20.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextfield(
                      onChangeCallback: () {
                        setState(() {});
                      },
                      controller: _emailAndMobileNumController,
                      title: "mobile number",
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.phoneNumber(),
                      ],
                      isOnlyNumber: true,
                      maxLength: 10,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextfield(
                      onChangeCallback: () {},
                      controller: _passwordController,
                      title: "password",
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.password(),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AdaptiveButtonWidget(
                          onTap: () {
                            context.pushRoute(SetPatternRoute());
                            SessionManager.saveLastScreen('/set-pattern');
                          },
                          title: "set pattern?",
                          disabled: false,
                          variant: "link",
                        ),
                        AdaptiveButtonWidget(
                          onTap: () {},
                          title: "add referral code",
                          disabled: false,
                          variant: "link",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // Sign In Button
              Padding(
                padding: EdgeInsets.only(left: 60.w, right: 60.w),
                child: AdaptiveButtonWidget(
                  disabled:
                      _emailAndMobileNumController.text.trim().isEmpty ||
                      _passwordController.text.trim().isEmpty ||
                      isLoading,
                  onTap: () async {
                    if (_passwordController.text.trim().isNotEmpty &&
                        _emailAndMobileNumController.text.trim().isNotEmpty) {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true; // Set loading state
                        });
                        var value = await _authRemoteController
                            .loginWithPhoneNumber(
                              phoneNum:
                                  _emailAndMobileNumController.text.trim(),
                              password: _passwordController.text.trim(),
                              context: context,
                              ref: ref,
                            );
                        setState(() {
                          isLoading = false; // Reset loading state
                        });

                        if (value.statusCode == 200 ||
                            value.statusCode == 201) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Login Successful! Redirecting to Set Pattern screen...',
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );

                          // Wait for SnackBar to finish before navigating
                          await Future.delayed(Duration(seconds: 2));

                          // context.pushRoute(SetPatternRoute());
                          context.pushRoute(HomeRoute());
                          SessionManager.saveLastScreen('/set-pattern');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Login Failed! Please try again.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    }
                  },
                  iconImg: AppImages.registerIcon,
                  title: "Sign in",
                ),
              ),
              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.only(left: 60.w, right: 60.w),
                child: Row(
                  children: [
                    Text(
                      "have not any account? ",
                      style: AppTypography.typo10PrimaryTextRegular,
                    ),
                    SizedBox(width: 5.w),
                    AdaptiveButtonWidget(
                      onTap: () {
                        context.pushRoute(SignupRoute());
                        SessionManager.saveLastScreen('/signup');
                      },
                      title: "register",
                      disabled: false,
                      type: "textBold",
                      variant: "link",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              Padding(
                padding: EdgeInsets.only(left: 60.w, right: 60.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "or signin with",
                      style: AppTypography.title12PrimaryTextBold,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        AdaptiveButtonWidget(
                          onTap: () {
                            _googleLoginController.signInWithGoogle(
                              context,
                              ref,
                            );
                          },
                          backgroundImage: AppImages.backgroundEllipseImage,
                          overlayImage: AppImages.googleIcon,
                        ),
                        AdaptiveButtonWidget(
                          onTap: () {},
                          backgroundImage: AppImages.backgroundEllipseImage,
                          overlayImage: AppImages.goodreadsIcon,
                        ),
                        AdaptiveButtonWidget(
                          onTap: () {},
                          backgroundImage: AppImages.backgroundEllipseImage,
                          overlayImage: AppImages.facebookIcon,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
