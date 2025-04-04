import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'dart:async';

@RoutePage()
class StockChartScreen extends StatefulWidget {
  const StockChartScreen({super.key});

  @override
  State<StockChartScreen> createState() => _StockChartScreenState();
}

class _StockChartScreenState extends State<StockChartScreen> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  late TrackballBehavior _trackballBehavior;
  late ZoomPanBehavior _zoomPanBehavior; // ✅ Added for scrolling
  late io.Socket socket;
  Timer? _candleTimer;

  int candleDuration = 10; // 10 seconds
  int secondsPassed = 0;
  bool isFirstCandleCreated = false;

  _ChartData? currentCandle;

  @override
  void initState() {
    super.initState();
    data = [];

    _tooltip = TooltipBehavior(enable: true, format: 'point.x: point.close');
    _trackballBehavior = TrackballBehavior(enable: true);
    _zoomPanBehavior = ZoomPanBehavior(
      enablePanning: true, // ✅ Allow panning (scrolling)
      enablePinching: true, // ✅ Allow zooming
      enableDoubleTapZooming: true,
      enableSelectionZooming: true,
      zoomMode: ZoomMode.xy,
    );

    // socket = io.io(
    //   'https://mock-socket-stock.onrender.com/',
    //   io.OptionBuilder().setTransports(['websocket']).build(),
    // );
    socket = io.io(
      'http://192.168.255.103:3000',
      io.OptionBuilder().setTransports(['websocket']).build(),
    );
    // socket = io.io(
    //   'http://192.168.1.37:3000',
    //   io.OptionBuilder().setTransports(['websocket']).build(),
    // );

    socket.on('connect', (_) => print('Connected to server'));

    socket.on('stock_update', (stockData) {
      print('Received stock data: $stockData');
      if (mounted) _handleStockUpdate(stockData);
    });

    socket.on('disconnect', (_) => print('Disconnected from WebSocket'));

    _startCandleTimer();
  }

  void _startCandleTimer() {
    _candleTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      secondsPassed++;
      if (secondsPassed >= candleDuration) {
        _createNewCandle();
        secondsPassed = 0;
      }
    });
  }

  void _handleStockUpdate(dynamic stockData) {
    setState(() {
      double open = stockData['open'].toDouble();
      double close = stockData['close'].toDouble();
      double high = stockData['high'].toDouble();
      double low = stockData['low'].toDouble();

      if (!isFirstCandleCreated) {
        _createFirstCandle(open, high, low, close);
      } else {
        currentCandle!.high =
            high > currentCandle!.high ? high : currentCandle!.high;
        currentCandle!.low =
            low < currentCandle!.low ? low : currentCandle!.low;
        currentCandle!.close = close;
      }
    });
  }

  void _createFirstCandle(double open, double high, double low, double close) {
    currentCandle = _ChartData(DateTime.now(), high, low, open, close);
    data.add(currentCandle!);
    isFirstCandleCreated = true;
  }

  void _createNewCandle() {
    if (!mounted) return;

    setState(() {
      double newOpen = currentCandle!.close;
      double newHigh = newOpen;
      double newLow = newOpen;
      double newClose = newOpen;

      currentCandle = _ChartData(
        DateTime.now(),
        newHigh,
        newLow,
        newOpen,
        newClose,
      );

      data.add(currentCandle!);
    });
  }

  @override
  void dispose() {
    socket.disconnect();
    _candleTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Chart'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white, //  TradingView style background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SfCartesianChart(
          backgroundColor: Colors.white,

          primaryXAxis: DateTimeAxis(
            intervalType: DateTimeIntervalType.seconds,
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            axisLine: const AxisLine(color: Colors.black), // ✅ Axis color
            labelStyle: const TextStyle(color: Colors.black),
            majorGridLines: const MajorGridLines(color: Colors.grey),
            // autoScrollingDelta: 10,
          ),
          primaryYAxis: NumericAxis(
            minimum:
                data.isNotEmpty
                    ? data.map((e) => e.low).reduce((a, b) => a < b ? a : b) -
                        0.5 // 🔥 Small buffer
                    : 0,
            maximum:
                data.isNotEmpty
                    ? data.map((e) => e.high).reduce((a, b) => a > b ? a : b) +
                        0.5 // 🔥 Small buffer
                    : 40,
            interval: 0.5,
            axisLine: const AxisLine(color: Colors.black),
            labelStyle: const TextStyle(color: Colors.black),
            majorGridLines: const MajorGridLines(color: Colors.grey),
            enableAutoIntervalOnZooming: true,
            autoScrollingMode: AutoScrollingMode.start,
            rangePadding: ChartRangePadding.none,
          ),
          tooltipBehavior: _tooltip,
          trackballBehavior: _trackballBehavior,
          zoomPanBehavior: _zoomPanBehavior, //? Added scrolling support
          series: <CartesianSeries<_ChartData, DateTime>>[
            CandleSeries<_ChartData, DateTime>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              highValueMapper: (_ChartData data, _) => data.high,
              lowValueMapper: (_ChartData data, _) => data.low,
              openValueMapper: (_ChartData data, _) => data.open,
              closeValueMapper: (_ChartData data, _) => data.close,
              name: 'Stock Data',
              enableSolidCandles: true, // ? Looks better
              bullColor: Colors.green, // ? Up trend color
              bearColor: Colors.red, // ? Down trend color
              showIndicationForSameValues: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.high, this.low, this.open, this.close);

  final DateTime x; // ✅ Changed from String to DateTime
  double high;
  double low;
  double open;
  double close;
}
