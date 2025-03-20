import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenreComparison extends StatelessWidget {
  final List<String> title;
  final List<int> value;
  final List<Color> colors;

  const GenreComparison({
    super.key,
    required this.title,
    required this.value,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final barHeight = 20.h;
    final barBorderRadius = 3.r;

    return value[0] == 0 && value[1] == 0
        ? SizedBox()
        : Column(
          children: [
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${title[0]} ',
                      style: AppTypography.title10PrimaryTextRegular,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '${value[0]}%',
                      style: AppTypography.title14PrimaryTextRegular,
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      ' ${title[1]}',
                      style: AppTypography.title10PrimaryTextRegular,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '${value[1]}%',
                      style: AppTypography.title14PrimaryTextRegular,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                if (value[1] != 100)
                  Container(
                    width: value[0] == 100 ? 0.9.sw : (value[0] / 100) * 0.9.sw,
                    height: barHeight,
                    decoration: BoxDecoration(
                      color: colors[0],
                      borderRadius: BorderRadius.circular(barBorderRadius),
                    ),
                  ),
                if (value[0] != 100 || value[1] != 100) SizedBox(width: 2.w),
                if (value[0] != 100)
                  Expanded(
                    child: Container(
                      // width: (value[0]/10).sw,
                      height: barHeight,
                      decoration: BoxDecoration(
                        color: colors[1],
                        borderRadius: BorderRadius.circular(barBorderRadius),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        );
  }
}
