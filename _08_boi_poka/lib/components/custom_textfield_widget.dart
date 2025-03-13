import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomTextfield extends StatefulWidget {
  final Function()? onChangeCallback;
  final TextEditingController controller;
  final String title;
  final List<FormFieldValidator<String>> validators;
  final bool isObscure;
  final bool isOnlyNumber;
  final bool isOnlyNumeric;
  final FocusNode? focusNode;
  final int? maxLength;
  final String? variant;
  final bool showSearchIcon;
  final Function? searchFunction;
  final bool? showCountCounter;

  const CustomTextfield({
    super.key,
    required this.onChangeCallback,
    required this.controller,
    required this.title,
    required this.validators,
    this.isObscure = false,
    this.isOnlyNumber = false,
    this.isOnlyNumeric = false,
    this.focusNode,
    this.maxLength,
    this.variant,
    this.showSearchIcon = false,
    this.searchFunction,
    this.showCountCounter,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    // var orientation = MediaQuery.of(context).orientation;
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    // final formControlIconSize = 20.w;
    final textFieldBorderRadius = 10.r;

    List<TextInputFormatter> inputFormatters = [];

    if (widget.isOnlyNumber || widget.isOnlyNumeric) {
      inputFormatters.add(
        FilteringTextInputFormatter.digitsOnly,
      ); // Only numbers digits allowed
    }
    return SizedBox(
      width: double.infinity,
      child: FormBuilderTextField(
        name: widget.title,
        focusNode: widget.focusNode,
        onChanged: (value) => widget.onChangeCallback!(),
        obscureText: _isObscure,
        keyboardType:
            widget.isOnlyNumber
                ? TextInputType.number
                : widget.isOnlyNumeric
                ? TextInputType.number
                : TextInputType.text,
        inputFormatters: inputFormatters.isEmpty ? null : inputFormatters,
        cursorColor: AppColors.primaryColor,
        controller: widget.controller,
        maxLength: widget.maxLength,
        validator:
            widget.variant != "search"
                ? FormBuilderValidators.compose(widget.validators)
                : null,
        style: AppTypography.typo12PrimaryTextRegular,
        decoration: InputDecoration(
          counterText: widget.showCountCounter == true ? null : "",
          errorMaxLines: 2,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: isTablet ? 0.02.sh : 10.h,
          ),
          hintText: widget.title,
          hintStyle: AppTypography.typo12PrimaryTextRegular,
          filled: true,
          fillColor: AppColors.tertiaryColor,
          prefixIcon:
              widget.isOnlyNumber
                  ? SizedBox(
                    width: 40.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '+91 ',
                          style: AppTypography.title12PrimaryTextBold,
                        ),
                      ],
                    ),
                  )
                  : null,
          suffixIcon:
              widget.isObscure
                  ? Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                  )
                  : widget.showSearchIcon
                  ? Padding(
                    padding: EdgeInsets.zero,
                    child: IconButton(
                      onPressed: () {
                        widget.searchFunction!();
                      },
                      icon: Icon(Icons.search, color: Colors.grey),
                    ),
                  )
                  : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(textFieldBorderRadius),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(textFieldBorderRadius),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(textFieldBorderRadius),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(textFieldBorderRadius),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
