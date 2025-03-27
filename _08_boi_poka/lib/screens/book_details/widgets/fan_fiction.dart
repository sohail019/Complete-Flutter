import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/models/get_book_analytics_model.dart';
import 'package:_08_boi_poka/screens/book_details/widgets/custom_slider_pagination_widget.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class FanFictionA extends StatefulWidget {
  final GetBookAnalyticsModel analyticsData;
  const FanFictionA({super.key, required this.analyticsData});

  @override
  State<FanFictionA> createState() => _FanFictionAState();
}

class _FanFictionAState extends State<FanFictionA> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final likeIconSize = 15.w;

    final fanFictions = widget.analyticsData.data.fanFiction;
    final bookName = widget.analyticsData.data.book;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.20.sh,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            scrollBehavior: ScrollBehavior(),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: fanFictions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 39.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 24.5.r, // Image radius
                      backgroundImage: AssetImage(AppImages.profileUserWhite),
                      backgroundColor: AppColors.primaryColor,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bookName,
                            style: AppTypography.typo12PrimaryTextBold,
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            fanFictions[index].author,
                            style:
                                AppTypography.typo8PrimaryTextRegularUnderline,
                          ),
                          Text(
                            fanFictions[index].publishedAt,
                            style: AppTypography.typo8PrimaryTextRegular,
                          ),
                          SizedBox(height: 13.h),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    AppImages.fictionHeart,
                                    width: likeIconSize,
                                    height: likeIconSize,
                                  ),
                                  Text(
                                    '${fanFictions[index].likes}',
                                    style: AppTypography.typo12PrimaryTextBold,
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //   width: screenWidth * 0.05,
                              // ),
                              // Column(
                              //   children: [
                              //     Image.asset(
                              //       AppImages.fictionUser,
                              //       width: likeIconSize,
                              //       height: likeIconSize,
                              //     ),
                              //     Text(
                              //       '24',
                              //       style: AppTypography.typo12PrimaryTextBold,
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            fanFictions[index].shortDescription,
                            style: AppTypography.typo12PrimaryTextLight,
                          ),
                          // SizedBox(
                          //   height: 10.h,
                          // ),
                          // Container(
                          //   width: 52.w,
                          //   height: 1.h,
                          //   color: AppColors.primaryColor,
                          // ),
                          // SizedBox(
                          //   height: 10.h,
                          // ),
                          // Text(
                          //   "Rated: ${fanFictions[index].rated}",
                          //   style: AppTypography.typo10PrimaryTextBold,
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45.h,
                      child: VerticalDivider(color: AppColors.primaryColor),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _pageController.nextPage(
                              // index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Opacity(
                            opacity: index == fanFictions.length - 1 ? 0.3 : 1,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                                vertical: 5.h,
                              ),
                              child: Image.asset(
                                AppImages.arrowRight,
                                width: 26.w,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Text(
                            formatIndex(index),
                            style: AppTypography.typo12PrimaryTextBold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20.h),
        CustomSliderPaginationWidget(
          currentIndex: _currentIndex,
          pageController: _pageController,
          itemLength: fanFictions.length,
        ),
      ],
    );
  }
}

String formatIndex(int index) {
  return (index + 1).toString().padLeft(2, '0');
}
