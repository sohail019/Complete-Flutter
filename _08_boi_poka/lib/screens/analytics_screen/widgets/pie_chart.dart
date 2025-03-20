import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PieChartWidget extends StatefulWidget {
  final Map<String, dynamic> popularityPercentageList;
  const PieChartWidget({required this.popularityPercentageList, super.key});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = -1;
  List<dynamic> values = [];
  List<String> countries = [];
  final List<Color> colors = [
    AppColors.pallete1,
    AppColors.pallete2,
    AppColors.pallete3,
    AppColors.pallete4,
    AppColors.pallete5,
    AppColors.pallete6,
    AppColors.pallete7,
    AppColors.pallete8,
    AppColors.pallete9,
    AppColors.pallete10,
    AppColors.pallete11,
    AppColors.pallete12,
    AppColors.pallete13,
  ];

  @override
  void initState() {
    getKeyAndValue(widget.popularityPercentageList);
    touchedIndex = -1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: screenHeight * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.05),
          Center(
            child: SizedBox(
              width: double.infinity,
              height: screenHeight * 0.3,
              child: Skeleton.replace(
                child: Stack(
                  alignment: Alignment.center,

                  children: [
                    if (touchedIndex != -1)
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${values[touchedIndex]}%',
                              style: AppTypography.typo8PrimaryTextRegular,
                            ),
                            Text(
                              countries[touchedIndex],
                              style: AppTypography.typo8PrimaryTextRegular,
                            ),
                          ],
                        ),
                      ),
                    PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback: (
                            FlTouchEvent event,
                            pieTouchResponse,
                          ) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndex = -1;
                                return;
                              }
                              touchedIndex =
                                  pieTouchResponse
                                      .touchedSection!
                                      .touchedSectionIndex;
                            });
                          },
                        ),
                        sectionsSpace: 0,
                        centerSpaceColor: Colors.transparent,
                        startDegreeOffset: screenWidth * -0.55,
                        centerSpaceRadius: 75,
                        sections: List.generate(values.length, (index) {
                          double value = double.parse(values[index].toString());
                          final isTouched = index == touchedIndex;
                          return PieChartSectionData(
                            value: value,
                            color: colors[index],
                            radius: isTouched ? 75.r : 60.r,
                            borderSide:
                                isTouched
                                    ? const BorderSide(
                                      color: Colors.white,
                                      width: 6,
                                    )
                                    : BorderSide(
                                      color: Colors.white.withOpacity(0),
                                    ),
                            title: value > 0 ? '${value.toInt()}%' : '',
                            titleStyle: AppTypography.typo8PrimaryTextRegular,
                            titlePositionPercentageOffset: 1.4,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          countries.isNotEmpty
              ? Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                child: GridView.builder(
                  padding: const EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  itemCount: countries.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 6.0,
                    crossAxisSpacing: screenWidth * 0.01,
                    mainAxisSpacing: screenHeight * 0.012,
                  ),
                  itemBuilder: (context, index) {
                    return ColorPaletteItem(
                      title: countries[index],
                      color: colors[index],
                      style: AppTypography.typo8PrimaryTextRegular,
                    );
                  },
                ),
              )
              : Container(
                margin: EdgeInsets.only(top: screenHeight * 0.01),
                height: screenHeight * 0.05,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: screenWidth * 0.05,
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: const Text("Shimmer Effect"),
                    );
                  },
                ),
              ),
        ],
      ),
    );
  }

  Future<void> getKeyAndValue(Map<String, dynamic> mapData) async {
    Map<String, dynamic> map = mapData;
    countries = map.keys.toList();
    values = map.values.toList();
  }
}

class ColorPaletteItem extends StatelessWidget {
  final String title;
  final Color color;
  final TextStyle style;

  const ColorPaletteItem({
    super.key,
    required this.title,
    required this.color,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet =
        View.of(context).physicalSize.shortestSide /
            View.of(context).devicePixelRatio >=
        680;
    var orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: screenWidth * 0.025,
          height: screenWidth * 0.025,
          color: color,
          margin: const EdgeInsets.only(right: 5),
        ),
        Text(
          title,
          style: AppTypography.typo8PrimaryTextRegular,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
