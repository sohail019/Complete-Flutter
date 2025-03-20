import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GanttChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final String genreTitle;
  final int genrePercentage;
  final Color? foregroundColor;
  final Color? backgroundColor;

  const GanttChart({
    super.key,
    required this.data,
    required this.genreTitle,
    required this.genrePercentage,
    this.foregroundColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return genrePercentage == 0
        ? SizedBox()
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${genreTitle.toString().toLowerCase()} $genrePercentage%',
              style: AppTypography.title12PrimaryTextRegular,
            ),
            SizedBox(height: 10.h),
            Column(children: data.map((item) => _buildChartRow(item)).toList()),
            SizedBox(height: 10.h),
          ],
        );
  }

  Widget _buildChartRow(Map<String, dynamic> item) {
    double accumulatedWidth = 0;

    for (var i = 0; i < data.indexOf(item); i++) {
      accumulatedWidth +=
          (formatToTwoDecimals(data[i]['value']) / 100) * 0.5.sw;
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                decoration: BoxDecoration(
                  color: backgroundColor ?? AppColors.pallete10opcaticty100,
                  borderRadius: BorderRadius.circular(3.r),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        item['label'],
                        style: AppTypography.typo9PrimaryTextRegular,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: accumulatedWidth),
                            height: 13.h,
                            decoration: BoxDecoration(
                              color: foregroundColor ?? AppColors.pallete10,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                            width:
                                data.length == 1
                                    ? 0.46.sw
                                    : (item['value'] / 100) * 0.46.sw,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 4.w),
            SizedBox(
              width: 40.w,
              child: Text(
                '${formatToTwoDecimals(item['value'])}%',
                style: AppTypography.typo10Height12PrimaryTextSemiBold,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
      ],
    );
  }
}

double formatToTwoDecimals(num value) {
  return double.parse(value.toStringAsFixed(2));
}
