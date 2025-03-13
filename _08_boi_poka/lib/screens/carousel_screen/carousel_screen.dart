import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/screens/auth/signup_screen/signup_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final scaffolKey = GlobalKey<ScaffoldState>();

  bool isLoading = true;

  final List<Map<String, dynamic>> carouselItems = [
    {
      "title": "Welcome to BoiPoka",
      "description":
          "Dive into the world of books and celebrate the bookworm in you.",
    },
    {
      "title": "Explore Genres",
      "description":
          "Discover a wide range of genres and find your next favorite book.",
    },
    {
      "title": "Personalized Suggestions",
      "description":
          "Get book suggestions tailored to your reading preferences.",
    },
    {
      "title": "Join the Inner Circle",
      "description":
          "Connect with fellow book lovers and share your reading experiences.",
    },
    {
      "title": "Start Your Journey",
      "description":
          "Begin your adventure with BoiPoka and unlock the joy of reading.",
    },
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >
        680;

    var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final lineWormHeight = 0.75.sh;
    final leftRightPosition = 57.0.w;

    return Scaffold(
      key: scaffolKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: leftRightPosition,
            child: Container(
              width: 1.w,
              height: lineWormHeight,
              color: AppColors.pokaLineColor,
            ),
          ),
          Positioned(
            right: 18.0.w,
            top: 0.63.sh,
            child: Image.asset(
              AppImages.upsideDownWorm,
              height: 240.w,
              width: 240.w,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37.w),
                  child: Row(
                    children: List.generate(
                      carouselItems.length,
                      (index) => Container(
                        width: 10.w,
                        height: 10.w,
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              _currentIndex == index
                                  ? AppColors.primaryColor
                                  : AppColors.greyColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarouselSlider.builder(
                      itemCount: carouselItems.length,
                      itemBuilder: (context, index, realIndex) {
                        final item = carouselItems[index];
                        return orientation == Orientation.portrait
                            ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 37.w),
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item["title"],
                                      style:
                                          AppTypography
                                              .title40Height35PrimaryTextBold,
                                    ),
                                    SizedBox(height: 21.h),
                                    Padding(
                                      padding: EdgeInsets.only(right: 73.w),
                                      child: Text(
                                        item["description"],
                                        style:
                                            AppTypography
                                                .typo14PrimaryTextRegular,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            : Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.06,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.75,
                                      height: screenHeight * 0.3,
                                      child: FittedBox(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          item['title'],
                                          style:
                                              AppTypography
                                                  .title40PrimaryTextBold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.05),
                                    SizedBox(
                                      width: screenWidth * 0.75,
                                      height: screenHeight * 0.2,

                                      child: FittedBox(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          item['description'],
                                          style:
                                              AppTypography
                                                  .typo12PrimaryTextLight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                      },
                      options: CarouselOptions(
                        reverse: false,
                        scrollDirection: Axis.horizontal,
                        height: isTablet ? 0.5.sh : 0.35.sh,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.easeOutSine,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: AdaptiveButtonWidget(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    disabled: false,
                    title: "Skip",
                    iconImg: AppImages.goAheadArrowIcon,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
