import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadioWidget extends StatelessWidget {
  final String value;
  final String selectedOption;
  final ValueChanged<String?> onChanged;
  final String label;

  const CustomRadioWidget({
    super.key,
    required this.value,
    required this.selectedOption,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20.w,
          height: 20.w,
          child: Transform.scale(
            scale: 1.4,
            child: Radio<String>(
              value: value,
              groupValue: selectedOption,
              activeColor: AppColors.primaryColor,
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(width: 4.w),
        Text(label, style: AppTypography.typo12PrimaryTextRegular),
      ],
    );
  }
}
