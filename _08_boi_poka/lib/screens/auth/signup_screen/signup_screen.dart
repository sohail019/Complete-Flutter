import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/components/custom_textfield_widget.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/controller/auth_remote_controller.dart';
import 'package:_08_boi_poka/core/utils/api_utils.dart';
import 'package:_08_boi_poka/screens/auth/signin_screen/signin_screen.dart';
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
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumController = TextEditingController();
  final _passwordController = TextEditingController();

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
                    // SizedBox(height: 10.h),
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
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SigninScreen(),
                                ),
                                (route) => true,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Registered Successfully"),
                                ),
                              );

                              // todo: referralConsentDialogView comes here
                            }
                          } catch (e) {
                            context.loaderOverlay.hide();
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SigninScreen(),
                          ),
                        );
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
                          onTap: () {},
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
