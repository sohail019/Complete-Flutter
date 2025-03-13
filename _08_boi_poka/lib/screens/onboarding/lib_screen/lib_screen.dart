import 'dart:io';

import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/components/common_appbar.dart';
import 'package:_08_boi_poka/components/custom_drawer.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/screens/carousel_screen/carousel_screen.dart';
import 'package:_08_boi_poka/screens/onboarding/lib_screen/data/lib_images.dart';
import 'package:_08_boi_poka/screens/onboarding/lib_screen/widget/library_card_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class LibScreen extends StatefulWidget {
  final File? imageFile;
  const LibScreen({super.key, this.imageFile});

  @override
  State<LibScreen> createState() => _LibScreenState();
}

class _LibScreenState extends State<LibScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    // var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child:
            isTablet
                ? PreferredSize(
                  preferredSize: Size.fromHeight(50.h),
                  child: CommonAppbar(
                    drawerFunction:
                        () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                )
                : CommonAppbar(
                  drawerFunction: () => _scaffoldKey.currentState?.openDrawer(),
                ),
      ),
      drawer: CustomDrawer(),
      body: SizedBox(
        height: 1.0.sh,
        child: Stack(
          children: [
            Positioned(
              width: 80.w,
              height: 100.h,
              right: 0,
              bottom: 0,
              child: Image.asset(
                AppImages.pokaLeftFacing,
                width: 0.3.sw,
                height: 0.3.sh,
                fit: BoxFit.contain,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 10.h, left: 15.h),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "create your library",
                            style: AppTypography.title40PrimaryTextBold,
                          ),
                          SizedBox(height: 35.h),
                          Text(
                            "photos of your library",
                            style: AppTypography.typo16MediumTextRegular,
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              LibraryCardWidget(
                                onTap: () {},
                                libicon: LibImages.uploadFromPhone,
                                text: "upload from phone",
                              ),
                              SizedBox(width: 8.w),
                              LibraryCardWidget(
                                onTap: () {},
                                libicon: LibImages.openPhoneCamera,
                                text: "open phone camera",
                              ),
                            ],
                          ),
                          SizedBox(height: 28.h),
                          Text(
                            "your book library",
                            style: AppTypography.typo16MediumTextRegular,
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              LibraryCardWidget(
                                onTap: () {},
                                libicon: LibImages.amazonKindle,
                                text: "connect with kindle",
                              ),
                              SizedBox(width: 8.w),
                              LibraryCardWidget(
                                onTap: () {},
                                libicon: LibImages.eBookLibrary,
                                text: "any other e-book library",
                              ),
                            ],
                          ),
                          SizedBox(height: 28.h),
                          Text(
                            "your audio book library",
                            style: AppTypography.typo16MediumTextRegular,
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              LibraryCardWidget(
                                onTap: () {},
                                libicon: LibImages.audible,
                                text: "connect with audible",
                              ),
                              SizedBox(width: 8.w),
                              LibraryCardWidget(
                                onTap: () {},
                                libicon: LibImages.audioLibrary,
                                text: "any other audio library",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 34.w,
                        vertical: 20.h,
                      ),
                      child: AdaptiveButtonWidget(
                        disabled: false,
                        onTap: () {
                          //? select genre logic will come here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarouselScreen(),
                            ),
                          );
                        },
                        title: "next",
                        iconImg: AppImages.nextIcon,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
