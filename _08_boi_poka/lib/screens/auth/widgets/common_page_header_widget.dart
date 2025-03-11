import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonPageHeaderWidget extends StatelessWidget {
  final String title;
  const CommonPageHeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240.h,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  AppImages.halfWorm,
                  width: 150.w,
                  height: 90.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 30.w,
                bottom: 60.h,
                child: Text(title, style: AppTypography.title40PrimaryTextBold),
              ),
            ],
          ),
        ),
        Container(height: 1.h, color: Colors.black, width: 100.sw),
      ],
    );
  }
}
