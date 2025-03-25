import 'package:_08_boi_poka/components/date_formatter.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/core/services/datasources/shared_preference_impl.dart';
import 'package:_08_boi_poka/providers/drawer_selected_index_provider/drawer_selected_index_provider.dart';
import 'package:_08_boi_poka/providers/home_screen_provider/home_screen_notifier.dart';
import 'package:_08_boi_poka/screens/book_details/widgets/logout_dialogue.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const CustomDrawer({super.key, this.scaffoldKey});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String? fullName,
      profileUrl,
      createdAt,
      completedBooks,
      totalBooks,
      innerCircleId;
  int unreadBooks = 0;
  @override
  void initState() {
    super.initState();
    initializeProfileData();
  }

  @override
  Widget build(BuildContext context) {
    // final isTablet =
    //     View.of(context).physicalSize.shortestSide /
    //         View.of(context).devicePixelRatio >=
    //     680;
    // var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final isPortrait = orientation == Orientation.portrait;

    var profileImageSizeWidth = 96.w;
    final profileImageBorderRadius = 10.r;
    // print(createdAt);
    List<Map<String, dynamic>> menuItems = [
      // {
      //   "item": "add books",
      //   "icon": FontAwesomeIcons.book,
      // },
      // {"item": "read ($completedBooks)", "icon": FontAwesomeIcons.bookAtlas},
      // {"item": "unread ($unreadBooks)", "icon": FontAwesomeIcons.bookBible},
      {"item": "settings", "icon": Icons.logout},
      {"item": "help & feedback", "icon": Icons.logout},
      {"item": "my inner circle", "icon": Icons.logout},
      {"item": "inner circle manager", "icon": Icons.logout},
      {"item": "my profile", "icon": Icons.logout},
      {"item": "logout", "icon": Icons.logout},
    ];
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: AppColors.mainDrawerBackgroundColor,
      width: 0.8.sw,
      child: Column(
        children: [
          SizedBox(
            height: 0.25.sh,
            width: double.infinity,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 0.45.sw,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              fullName ?? '',
                              style: AppTypography.title20TertiaryTextBold,
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              'member since ${formatDateFromString(createdAt ?? "")}',
                              style:
                                  AppTypography
                                      .typo8Height10TertiaryTextRegular,
                            ),
                            SizedBox(height: 16.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 2.h,
                    color: AppColors.secondaryColor,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: -15.h,
                  left: 8.w,
                  child: Container(
                    width: screenWidth * 0.30,
                    height: screenHeight * 0.14,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(
                        profileImageBorderRadius,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          profileImageBorderRadius,
                        ),
                        child:
                            (profileUrl != null && profileUrl!.isNotEmpty)
                                ? Image.network(
                                  profileUrl!,
                                  width: profileImageSizeWidth,
                                  height: profileImageSizeWidth,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(child: Text("No Image"));
                                  },
                                )
                                : SizedBox(
                                  width: profileImageSizeWidth,
                                  height: profileImageSizeWidth,
                                  child: Icon(Icons.person_2, size: 50.w),
                                ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 45.h,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                      ),
                      child: Image.asset(
                        AppImages.closeIcon,
                        width: 20.w,
                        height: 20.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(
                top: 40.h,
                left: 39.w,
                right: 20.w,
                bottom: 20.h,
              ),
              child: Consumer(
                builder: (context, ref, child) {
                  final selectedScreenIndex = ref.watch(
                    selectedIndexHomeProvider,
                  );
                  return Container(
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: ListTile(
                            onTap:
                                selectedScreenIndex != index
                                    ? () {
                                      widget.scaffoldKey?.currentState
                                          ?.closeDrawer();
                                      Future.delayed(
                                        Duration(milliseconds: 100),
                                        () {
                                          ref
                                              .read(
                                                drawerSelectedIndexProvider
                                                    .notifier,
                                              )
                                              .state = index;

                                          if (index == 2) {
                                            context.pushRoute(
                                              PageRouteInfo(
                                                AppRoutes.homeScreen,
                                              ),
                                            );
                                          } else if (index == 3) {
                                            context.pushRoute(
                                              PageRouteInfo(AppRoutes.carousel),
                                            );
                                          } else if (index == 4) {
                                            context.pushRoute(
                                              PageRouteInfo(AppRoutes.splash),
                                            );
                                          } else if (index == 5) {
                                            logoutDialogue(context);
                                          }
                                        },
                                      );
                                    }
                                    : () {},

                            leading: Container(
                              color: AppColors.secondaryColor,
                              width: 10.w,
                              height: 2.h,
                            ),
                            title: Text(
                              menuItems[index]['item'],
                              style: AppTypography.typo12TertiaryTextBold,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initializeProfileData() async {
    final sharedPref = SharedPrefController();
    fullName = await sharedPref.getData("name");
    createdAt = await sharedPref.getData("createdAt");
    profileUrl = await sharedPref.getData("profileUrl");
    completedBooks = await sharedPref.getData("completedBooks");
    totalBooks = await sharedPref.getData("totalBooks");
    innerCircleId = await sharedPref.getData("innerCircleId");
    unreadBooks =
        int.parse(totalBooks ?? '0') - int.parse(completedBooks ?? '0');
    setState(() {});
  }
}
