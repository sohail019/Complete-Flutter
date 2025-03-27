import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/models/get_book_analytics_model.dart';
import 'package:_08_boi_poka/screens/book_details/widgets/custom_slider_pagination_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class Reviews extends ConsumerStatefulWidget {
  final GetBookAnalyticsModel analyticsData;
  const Reviews({super.key, required this.analyticsData});

  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends ConsumerState<Reviews> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final expertReviews = widget.analyticsData.data.expertReviews;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 130.h,
            child: PageView.builder(
              controller: _pageController,
              itemCount: expertReviews.length,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              itemBuilder:
                  (context, index) => Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 15.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              AppImages.quotesIcon,
                              height: 24.42.h,
                              width: 10.03.w,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 29.h),
                            Text(
                              formatIndex(index),
                              style: AppTypography.typo12PrimaryTextBold,
                            ),
                          ],
                        ),
                        SizedBox(width: 12.78.w),
                        Container(
                          color: AppColors.primaryColor,
                          height: 73.h,
                          width: 1.w,
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                expertReviews[index].name,
                                style: AppTypography.typo12PrimaryTextBold,
                              ),
                              SizedBox(height: 32.h),
                              Text(
                                expertReviews[index].text,
                                style: AppTypography.typo12PrimaryTextLight,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
          CustomSliderPaginationWidget(
            currentIndex: _currentIndex,
            pageController: _pageController,
            itemLength: expertReviews.length,
          ),
        ],
      ),
    );
  }
}

String formatIndex(int index) {
  return (index + 1).toString().padLeft(2, '0');
}
