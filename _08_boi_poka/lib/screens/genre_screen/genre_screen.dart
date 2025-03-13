import 'package:_08_boi_poka/components/adaptive_button.dart';
import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/screens/genre_screen/widgets/genre_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      "image": "lib/assets/icons/genres/romance.png",
      // "image": AppImages.allowIcon,
      "isSelected": false,
    },
    {
      "text": "Crime & Thriller",
      "image": "assets/images/genre/crime_and_thriller.png",
      "isSelected": false,
    },
    {
      "text": "Fantasy",
      "image": "assets/images/genre/fantasy.png",
      "isSelected": false,
    },
    {
      "text": "Mystery",
      "image": "assets/images/genre/mystery.png",
      "isSelected": false,
    },
    {
      "text": "Science Fiction",
      "image": "assets/images/genre/science_fiction.png",
      "isSelected": false,
    },
    {
      "text": "Horror",
      "image": "assets/images/genre/horror.png",
      "isSelected": false,
    },
    {
      "text": "Literary Fiction",
      "image": "assets/images/genre/literary_fiction.png",
      "isSelected": false,
    },
    {
      "text": "Drama",
      "image": "assets/images/genre/drama.png",
      "isSelected": false,
    },
    {
      "text": "Young Adult",
      "image": "assets/images/genre/young_adult.png",
      "isSelected": false,
    },
    {
      "text": "Biographies",
      "image": "assets/images/genre/biographies.png",
      "isSelected": false,
    },
    {
      "text": "Self Help",
      "image": "assets/images/genre/self_help.png",
      "isSelected": false,
    },
    {
      "text": "Cook Books",
      "image": "assets/images/genre/cook_books.png",
      "isSelected": false,
    },
    {
      "text": "Travel Writing",
      "image": "assets/images/genre/travel_writing.png",
      "isSelected": false,
    },
    {
      "text": "True Crime",
      "image": "assets/images/genre/true_crime.png",
      "isSelected": false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    var orientation = MediaQuery.of(context).orientation;
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
                    top: isTablet ? 105.h : 95.h,
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
                      SizedBox(height: 55.h),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 50.w,
                    bottom: isTablet ? 30.h : 0,
                  ),
                  child: AdaptiveButtonWidget(
                    disabled: !isNavigateEnable,
                    selectedGenreLen: selectedGenre.length,
                    onTap: () {},
                    title: "next",
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
