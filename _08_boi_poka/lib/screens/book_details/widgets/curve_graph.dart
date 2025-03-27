import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CurveGraph extends StatefulWidget {
  final Map<String, dynamic> bookMoodData;
  const CurveGraph({required this.bookMoodData, super.key});

  @override
  State<CurveGraph> createState() => _CurveGraphState();
}

class _CurveGraphState extends State<CurveGraph> {
  double yMax = 30.0;
  List<Color> gradientColors = [
    Colors.black,
    const Color.fromARGB(255, 214, 214, 214),
  ];

  Map<String, dynamic> bookMoodListData = {};
  List<String> moods = [];

  @override
  void initState() {
    getMoodListData(widget.bookMoodData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1.8,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: Skeleton.shade(child: LineChart(mainData())),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 12);

    String text;

    if (moods.length <= 3) {
      switch (value.toInt()) {
        case 0:
          text = moods[0];
          break;
        case 1:
          text = moods[1];
          break;
        case 2:
          text = moods[2];
          break;
        default:
          return Container();
      }
    } else {
      switch (value.toInt()) {
        case 1:
          text = moods[1];
          break;
        case 3:
          text = moods[3];
          break;
        case 5:
          text = moods[5];
          break;
        case 7:
          text = moods[7];
          break;
        default:
          return Container();
      }
    }

    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: style, textAlign: TextAlign.left),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
    String text;
    switch (value.toInt()) {
      case 1:
        text = '';
        break;
      case 3:
        text = '';
        break;
      case 5:
        text = '';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(color: Colors.black45, strokeWidth: 1);
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(color: Colors.black87, strokeWidth: 1);
        },
      ),
      titlesData: FlTitlesData(
        rightTitles: const AxisTitles(),
        topTitles: const AxisTitles(),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX:
          moods.length.toDouble() <= 9.0
              ? moods.length.toDouble() - 1.0
              : moods.length.toDouble() - 2.0,
      minY: 0,
      maxY: yMax,
      lineBarsData: [
        LineChartBarData(
          spots:
              List.generate(moods.length > 9 ? 9 : bookMoodListData.length, (
                index,
              ) {
                return FlSpot(
                  index.toDouble(),
                  double.parse(bookMoodListData[moods[index]].toString()),
                );
              }).toList(),
          isCurved: true,
          gradient: LinearGradient(colors: gradientColors),
          isStrokeCapRound: true,
          dotData: FlDotData(
            getDotPainter: (p0, p1, p2, p3) {
              return FlDotCirclePainter(color: Colors.black45, radius: 5);
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors:
                  gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
            ),
          ),
        ),
      ],
    );
  }

  void getMoodListData(mapData) {
    bookMoodListData = mapData;
    moods = bookMoodListData.keys.toList();
    getMaxSize();
  }

  void getMaxSize() {
    final yValues = bookMoodListData.values.toList();
    yValues.indexWhere((element) {
      if (element >= yMax) {
        yMax = double.parse(element.toString()) + 20.0;
      }
      return false;
    });
    print("Y value - $yMax");
  }
}
