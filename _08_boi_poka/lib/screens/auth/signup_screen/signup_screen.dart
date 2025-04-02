import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/components/custom_textfield_widget.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/controller/auth_remote_controller.dart';
import 'package:_08_boi_poka/controller/google_login_controller.dart';
import 'package:_08_boi_poka/core/utils/api_utils.dart';
import 'package:_08_boi_poka/core/utils/function_utils.dart';
import 'package:_08_boi_poka/core/utils/session_manager.dart';
import 'package:_08_boi_poka/navigation/app_router.gr.dart';
import 'package:_08_boi_poka/screens/auth/widgets/common_page_header_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumController = TextEditingController();
  final _passwordController = TextEditingController();

  final _googleLoginController = GoogleLoginController();

  bool isFormValid() {
    return _nameController.text.trim().isNotEmpty &&
        _emailController.text.trim().isNotEmpty &&
        _phoneNumController.text.trim().isNotEmpty &&
        _passwordController.text.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final formControlFieldGap = 8.h;

    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CommonPageHeaderWidget(title: 'let\'s get \nstarted.'),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 52.h, horizontal: 60.w),
                child: Column(
                  children: [
                    CustomTextfield(
                      onChangeCallback: () {
                        setState(() {});
                      },
                      validators: [FormBuilderValidators.required()],
                      controller: _nameController,
                      title: "full name",
                    ),
                    SizedBox(height: formControlFieldGap),
                    CustomTextfield(
                      onChangeCallback: () {
                        setState(() {});
                      },
                      controller: _emailController,
                      title: "email",
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ],
                    ),
                    SizedBox(height: formControlFieldGap),
                    CustomTextfield(
                      onChangeCallback: () {
                        setState(() {});
                      },
                      isOnlyNumber: true,
                      maxLength: 10,
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.phoneNumber(),
                      ],
                      controller: _phoneNumController,
                      title: "phone number",
                    ),
                    SizedBox(height: formControlFieldGap),
                    CustomTextfield(
                      onChangeCallback: () {
                        setState(() {});
                      },
                      controller: _passwordController,
                      title: "password",
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.password(),
                      ],
                      isObscure: true,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  children: [
                    AdaptiveButtonWidget(
                      disabled: !isFormValid(),
                      onTap: () async {
                        if (isFormValid() &&
                            _formKey.currentState!.validate()) {
                          final authRemoteController = AuthRemoteController();

                          context.loaderOverlay.show();

                          try {
                            ResponseModel responseModel =
                                await authRemoteController.register(
                                  fullName: _nameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  phoneNum: _phoneNumController.text.trim(),
                                  password: _passwordController.text.trim(),
                                  context: context,
                                  ref: ref,
                                );

                            context.loaderOverlay.hide();

                            if (responseModel.statusCode == 200 ||
                                responseModel.statusCode == 201) {
                              await SessionManager.saveLastScreen('/signin');
                              getUserDataAndStore();
                              // Navigate to the Signin screen
                              // context.pushRoute(Otp);

                              final authController = AuthRemoteController();
                              await authController
                                  .forgetPassword(
                                    phoneNum: _phoneNumController.text.trim(),
                                    type: 'register',
                                  )
                                  .then((value) {
                                    context.loaderOverlay.hide();

                                    if (value.statusCode == 200 ||
                                        value.statusCode == 201) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'OTP Sent Successfully',
                                          ),
                                          backgroundColor: Colors.green,
                                        ),
                                      );

                                      // context.router.push()

                                      context.pushRoute(
                                        PageRouteInfo(
                                          AppRoutes.otp,
                                          args: OtpRouteArgs(
                                            phoneNum:
                                                _phoneNumController.text.trim(),
                                            otpType: 'register',
                                            isPhoneNumAuthentication: true,
                                          ),
                                        ),
                                      );
                                    }
                                  })
                                  .onError((error, stackTrace) {
                                    context.loaderOverlay.hide();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('OTP Sending Failed'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Registered Successfully!"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          } catch (e) {
                            context.loaderOverlay.hide();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Registration failed. Please try again.',
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      title: 'Register',
                      iconImg: AppImages.registerIcon,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppTypography.typo10PrimaryTextRegular,
                    ),
                    SizedBox(width: 5.w),
                    AdaptiveButtonWidget(
                      onTap: () {
                        context.pushRoute(SigninRoute());
                        SessionManager.saveLastScreen('/signup');
                      },
                      title: 'Sign In',
                      disabled: false,
                      variant: 'link',
                      type: 'textBold',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "or sign up with",
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
