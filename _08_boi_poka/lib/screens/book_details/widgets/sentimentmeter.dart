import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:speedometer_chart/speedometer_chart.dart';

class SentimentMeter extends StatefulWidget {
  final Map<String, dynamic> sentiments;
  const SentimentMeter({required this.sentiments, super.key});

  @override
  _SentimentMeterState createState() => _SentimentMeterState();
}

class _SentimentMeterState extends State<SentimentMeter> {
  double sentimentValue = 0.0;

  @override
  void initState() {
    getSentimentValue(widget.sentiments);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpeedometerChart(dimension: 230, value: (sentimentValue)),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlatformIconButton(
              icon: const Icon(
                Icons.sentiment_very_dissatisfied,
                color: Colors.red,
              ),
              onPressed: () {
                // setState(() {
                //   _value = 0.20;
                // });
              },
            ),
            PlatformIconButton(
              icon: const Icon(Icons.sentiment_neutral, color: Colors.orange),
              onPressed: () {
                // setState(() {
                //   _value = 0.40;
                // });
              },
            ),
            PlatformIconButton(
              icon: const Icon(
                Icons.sentiment_very_satisfied,
                color: Colors.green,
              ),
              onPressed: () {
                // setState(() {
                //   _value = 0.70;
                // });
              },
            ),
          ],
        ),
      ],
    );
  }

  void getSentimentValue(Map<String, dynamic> mapData) {
    if (mapData.isNotEmpty) {
      Map<String, dynamic> map = mapData;
      double positive = double.parse(map['positive'].toString());
      double negative = double.parse(map['negative'].toString());
      double neutral = double.parse(map['neutral'].toString());
      if (positive > negative && positive > neutral) {
        sentimentValue = positive;
      } else if (negative > positive && negative > neutral) {
        sentimentValue = negative;
      } else {
        sentimentValue = neutral;
      }
    }
  }
}
