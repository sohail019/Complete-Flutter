import 'package:_08_boi_poka/constants/app_colors.dart';
import 'package:_08_boi_poka/constants/app_images.dart';
import 'package:_08_boi_poka/constants/app_typography.dart';
import 'package:_08_boi_poka/models/get_book_analytics_model.dart';
import 'package:_08_boi_poka/screens/analytics_screen/widgets/pie_chart.dart';
import 'package:_08_boi_poka/screens/book_details/widgets/curve_graph.dart';
import 'package:_08_boi_poka/screens/book_details/widgets/sentimentmeter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class DataAnalysisAccordion extends ConsumerStatefulWidget {
  final GetBookAnalyticsModel analyticsData;
  const DataAnalysisAccordion({super.key, required this.analyticsData});

  @override
  _DataAnalysisAccordionState createState() => _DataAnalysisAccordionState();
}

class _DataAnalysisAccordionState extends ConsumerState<DataAnalysisAccordion> {
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    final expandIconSIze = 12.w;
    final getBookAnalyticsData = widget.analyticsData;
    final List<Item> data = generateItems(getBookAnalyticsData);

    return SingleChildScrollView(
      child: ExpansionPanelList.radio(
        elevation: 0,
        expandedHeaderPadding: EdgeInsets.zero,
        dividerColor: Colors.transparent,
        materialGapSize: 0.0,
        expandIconColor: Colors.transparent,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _expandedIndex = isExpanded ? null : index;
          });
        },
        children:
            data.asMap().entries.map<ExpansionPanelRadio>((entry) {
              int index = entry.key;
              Item item = entry.value;
              return ExpansionPanelRadio(
                value: index,
                backgroundColor: AppColors.secondaryColor,
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return SizedBox(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              isExpanded
                                  ? AppImages.accMinus
                                  : AppImages.accPlus,
                              fit: BoxFit.contain,
                              width: expandIconSIze,
                              height: expandIconSIze,
                            ),
                            SizedBox(width: 16.w),
                            Text(
                              item.headerValue,
                              style: AppTypography.title14PrimaryTextRegular,
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  );
                },
                body: item.widgetContent,
              );
            }).toList(),
      ),
    );
  }
}

class Item {
  Item({
    required this.widgetContent,
    required this.headerValue,
    this.isExpanded = false,
  });

  Widget widgetContent;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(GetBookAnalyticsModel analyticsData) {
  return [
    Item(
      headerValue: 'Popularity',
      widgetContent: PieChartWidget(
        popularityPercentageList: analyticsData.data.popularityCountry,
      ),
    ),
    // Item(
    //   headerValue: 'Yay/Nay',
    //   widgetContent: CircularProgressChart(percentage: 25),
    // ),
    Item(
      headerValue: 'Sentiment',
      widgetContent: SentimentMeter(
        sentiments: {
          "positive": analyticsData.data.sentiment.positive.toString(),
          "negative": analyticsData.data.sentiment.negative.toString(),
          "neutral": analyticsData.data.sentiment.neutral.toString(),
        },
      ),
    ),
    Item(
      headerValue: 'Book mood',
      widgetContent: CurveGraph(bookMoodData: analyticsData.data.bookReadMood),
    ),
  ];
}
