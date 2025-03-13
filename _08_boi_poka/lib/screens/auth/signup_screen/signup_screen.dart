import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/components/custom_textfield_widget.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/screens/auth/signin_screen/signin_screen.dart';
import 'package:_08_boi_poka/screens/auth/widgets/common_page_header_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumController = TextEditingController();
  final _passwordController = TextEditingController();
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

    final formControlFieldGap = 8.h;
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonPageHeaderWidget(title: 'let\'s get \nstarted.'),
              Padding(
                padding: EdgeInsets.only(top: 52.h, left: 60.w, right: 60.w),
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
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 40.w, left: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AdaptiveButtonWidget(
                      onTap: () {},
                      title: 'Register',
                      iconImg: AppImages.registerIcon,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 60.w, right: 60.w),
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
                padding: EdgeInsets.only(left: 60.w, right: 60.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "or sign up with",
                      style: AppTypography.title12PrimaryTextBold,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
