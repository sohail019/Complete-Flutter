import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/screens/analytics_screen/widgets/gantt_chart.dart';
import 'package:_08_boi_poka/screens/analytics_screen/widgets/genre_comparison.dart';
import 'package:_08_boi_poka/screens/analytics_screen/widgets/pie_chart.dart';
import 'package:_08_boi_poka/screens/analytics_screen/widgets/top_cards.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final int userBooksCount = 6467;
    final int physicalBookCount = 5678;
    final int eBookCount = 789;
    final int audioBookCount = 08;

    final List<Map<String, dynamic>> genrePercentages = [
      {
        "category": "Fiction",
        "data": [
          {"genre": "Fantasy", "percentage": 20.0},
          {"genre": "Mystery", "percentage": 10.0},
        ],
      },
      {
        "category": "Non-Fiction",
        "data": [
          {"genre": "Biography", "percentage": 15.0},
          {"genre": "Self-Help", "percentage": 25.0},
        ],
      },
    ];

    final List<Map<String, dynamic>> booksByAuthorOrigin = [
      {"authorOrigin": "North America", "count": 45},
      {"authorOrigin": "India", "count": 5},
      {"authorOrigin": "Europe", "count": 30},
      {"authorOrigin": "Africa", "count": 5},
      {"authorOrigin": "Rest of Asia", "count": 10},
      {"authorOrigin": "South America", "count": 5},
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0.01,
            child: Image.asset(
              AppImages.wormLogo,
              width: 0.3.sw,
              fit: BoxFit.contain,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 76.h),
                Text(
                  "analytics",
                  style: AppTypography.title40Height35PrimaryTextBold,
                ),
                SizedBox(height: 29.h),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Topcards(
                      title: 'total books',
                      value: userBooksCount.toString(),
                      color: AppColors.pallete5,
                    ),
                    SizedBox(width: 4.w),
                    Topcards(
                      title: 'physical',
                      value: physicalBookCount.toString(),
                      color: AppColors.pallete6,
                    ),
                    SizedBox(width: 4.w),
                    Topcards(
                      title: 'ebooks',
                      value: eBookCount.toString(),
                      color: AppColors.pallete7,
                    ),
                    SizedBox(width: 4.w),
                    Topcards(
                      title: 'audio',
                      value: audioBookCount.toString(),
                      color: AppColors.pallete8,
                    ),
                  ],
                ),

                SizedBox(height: 57.h),

                Text(
                  'Your reading persona',
                  style: AppTypography.title24PrimaryTextRegular,
                ),
                SizedBox(height: 25.h),
                Image.asset(
                  'lib/assets/images/area-map.png',
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 74.h),
                GenreComparison(
                  title: ['academic', 'leisure'],
                  value: [10, 90],
                  colors: [AppColors.pallete9, AppColors.pallete4],
                ),
                SizedBox(height: 16.h),
                GenreComparison(
                  title: ['fiction', 'non-fiction'],
                  value: [65, 35],
                  colors: [AppColors.pallete10, AppColors.pallete11],
                ),
                SizedBox(height: 16.h),
                GenreComparison(
                  title: ['original', 'translated'],
                  value: [40, 60],
                  colors: [AppColors.pallete12, AppColors.pallete13],
                ),
                // Genre Distribution
                SizedBox(height: 56.h),
                Text(
                  'Genre Distribution',
                  style: AppTypography.title24PrimaryTextRegular,
                ),
                SizedBox(height: 25.h),
                Column(
                  children:
                      genrePercentages.map((genre) {
                        List<Map<String, dynamic>> genreData =
                            (genre["data"] as List<dynamic>)
                                .cast<Map<String, dynamic>>();

                        int totalPercentage = genreData.fold(
                          0,
                          (sum, item) =>
                              sum + (item["percentage"] as num).toInt(),
                        );

                        return GanttChart(
                          genreTitle: genre["category"],
                          genrePercentage: totalPercentage,
                          data:
                              genreData
                                  .map(
                                    (detail) => {
                                      'label': detail["genre"],
                                      'value':
                                          (detail["percentage"] as num).toInt(),
                                    },
                                  )
                                  .toList(),
                        );
                      }).toList(),
                ),

                SizedBox(height: 56.h),

                // Books by Author Region
                Text(
                  'Authors from',
                  style: AppTypography.title24PrimaryTextRegular,
                ),
                SizedBox(height: 25.h),
                PieChartWidget(
                  popularityPercentageList: {
                    for (var author in booksByAuthorOrigin)
                      author["authorOrigin"]:
                          (author["count"] as num).toDouble(),
                  },
                ),
                Text(
                  'Languages',
                  style: AppTypography.title24PrimaryTextRegular,
                ),
                SizedBox(height: 14.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
