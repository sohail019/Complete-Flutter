import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/components/snackbar_widget.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_routes.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/core/utils/session_manager.dart';
import 'package:_08_boi_poka/navigation/app_router.gr.dart';
import 'package:_08_boi_poka/screens/onboarding/genre_screen/data/genre_images.dart';
import 'package:_08_boi_poka/screens/onboarding/genre_screen/widgets/genre_widget.dart';
import 'package:_08_boi_poka/screens/onboarding/scale_screen/scale_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<String> selectedGenre = [];
  bool isNavigateEnable = false;
  final List<Map<String, dynamic>> genres = [
    {
      "text": "Romance",
      "image": GenreImages.romance,
      // "image": AppImages.allowIcon,
      "isSelected": false,
    },
    {
      "text": "Crime & Thriller",
      "image": GenreImages.crimeAndThriller,
      "isSelected": false,
    },
    {"text": "Fantasy", "image": GenreImages.fantasy, "isSelected": false},
    {"text": "Mystery", "image": GenreImages.mystery, "isSelected": false},
    {
      "text": "Science Fiction",
      "image": GenreImages.scienceFiction,
      "isSelected": false,
    },
    {"text": "Horror", "image": GenreImages.horror, "isSelected": false},
    {
      "text": "Literary Fiction",
      "image": GenreImages.literaryFiction,
      "isSelected": false,
    },
    {"text": "Drama", "image": GenreImages.drama, "isSelected": false},
    {
      "text": "Young Adult",
      "image": GenreImages.youngAdult,
      "isSelected": false,
    },
    {
      "text": "Biographies",
      "image": GenreImages.biographies,
      "isSelected": false,
    },
    {"text": "Self Help", "image": GenreImages.selfHelp, "isSelected": false},
    {"text": "Cook Books", "image": GenreImages.cookBooks, "isSelected": false},
    {
      "text": "Travel Writing",
      "image": GenreImages.travelWriting,
      "isSelected": false,
    },
    {"text": "True Crime", "image": GenreImages.trueCrime, "isSelected": false},
  ];
  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    // var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 10.w,
              top: isTablet ? -0.05.sh : 0,
              child: Image.asset(
                AppImages.bouncyPoka,
                width: isTablet ? 0.9.sw : screenWidth,
                fit: BoxFit.contain,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: isTablet ? 65.w : 70.w,
                    right: isTablet ? 20.w : 30.w,
                    top: isTablet ? 105.h : 115.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "welcome",
                        style: AppTypography.title40PrimaryTextBold,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Select any 3 Genres you enjoy",
                        style: AppTypography.typo16PrimaryTextRegular,
                      ),
                      SizedBox(height: 26.h),
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isTablet ? 4 : 3,
                          crossAxisSpacing: isTablet ? 20.w : 25.w,
                          mainAxisSpacing: isTablet ? 2.h : 5.h,
                          childAspectRatio: isTablet ? 0.7 : 1,
                        ),
                        itemCount: genres.length,
                        itemBuilder: (context, index) {
                          final genre = genres[index];
                          return GenreWidget(
                            iconImg: genre["image"],
                            text: genre["text"],
                            onTap: () {
                              if (genres[index]["isSelected"] == false) {
                                selectedGenre.add(genres[index]["text"]);
                                genres[index]["isSelected"] = true;
                              } else {
                                selectedGenre.remove(genres[index]["text"]);
                                genres[index]["isSelected"] = false;
                              }
                              if (selectedGenre.length >= 3) {
                                isNavigateEnable = true;
                              } else {
                                isNavigateEnable = false;
                              }
                              setState(() {});
                            },
                          );
                        },
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 60.w,
                    bottom: isTablet ? 30.h : 0,
                  ),
                  child: AdaptiveButtonWidget(
                    disabled: false,
                    selectedGenreLen: selectedGenre.length,
                    onTap:
                        isNavigateEnable
                            ? () {
                              if (selectedGenre.length >= 3) {
                                context.pushRoute(
                                  PageRouteInfo(
                                    AppRoutes.scale,
                                    args: ScaleRouteArgs(
                                      selectedGenre: selectedGenre,
                                    ),
                                  ),
                                );
                              } else {
                                SnackbarWidget(
                                  textToShow: "Please Select At Least 3 Genre",
                                  durationInMilliseconds: 3000,
                                  context: context,
                                );
                              }
                            }
                            : () {},
                    title: "next",
                    iconImg: AppImages.nextIcon,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
