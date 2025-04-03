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
  late io.Socket socket;
  Timer? _candleTimer;

  final int maxDataPoints = 5;
  int candleDuration = 30; // 🔥 Changed to 30 seconds
  int secondsPassed = 0;
  bool isFirstCandleCreated = false; // Flag to track first candle

  _ChartData? currentCandle;

  @override
  void initState() {
    super.initState();
    data = [];

    _tooltip = TooltipBehavior(enable: true, format: 'point.x: point.close');
    _trackballBehavior = TrackballBehavior(enable: true);

    // socket = io.io(
    //   'http://192.168.1.37:3000',
    //   io.OptionBuilder().setTransports(['websocket']).build(),
    // );
    socket = io.io(
      'https://mock-socket-stock.onrender.com/',
      io.OptionBuilder().setTransports(['websocket']).build(),
    );

    socket.on('connect', (_) {
      print('Connected to server');
    });

    socket.on('stock_update', (stockData) {
      print('Received stock data: $stockData');
      if (mounted) {
        _handleStockUpdate(stockData);
      }
    });

    socket.on('disconnect', (_) {
      print('Disconnected from WebSocket');
    });

    _startCandleTimer();
  }

  void _startCandleTimer() {
    _candleTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      secondsPassed++;
      if (secondsPassed >= candleDuration) {
        _createNewCandle();
        secondsPassed = 0; // Reset counter
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
        // First candle should be created immediately
        _createFirstCandle(open, high, low, close);
      } else {
        // Update current candle high/low in real-time
        currentCandle!.high =
            high > currentCandle!.high ? high : currentCandle!.high;
        currentCandle!.low =
            low < currentCandle!.low ? low : currentCandle!.low;
        currentCandle!.close = close;
      }
    });
  }

  void _createFirstCandle(double open, double high, double low, double close) {
    currentCandle = _ChartData(
      DateTime.now().millisecondsSinceEpoch.toString(),
      high,
      low,
      open,
      close,
    );

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
        DateTime.now().millisecondsSinceEpoch.toString(),
        newHigh,
        newLow,
        newOpen,
        newClose,
      );

      data.add(currentCandle!);

      if (data.length > maxDataPoints) {
        data.removeAt(0);
      }
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(interval: 1, labelRotation: 45),
          primaryYAxis: NumericAxis(
            minimum:
                data.isNotEmpty
                    ? data.map((e) => e.low).reduce((a, b) => a < b ? a : b)
                    : 0,
            maximum:
                data.isNotEmpty
                    ? data.map((e) => e.high).reduce((a, b) => a > b ? a : b)
                    : 40,
            interval: 10,
          ),
          tooltipBehavior: _tooltip,
          trackballBehavior: _trackballBehavior,
          series: <CartesianSeries<_ChartData, String>>[
            CandleSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              highValueMapper: (_ChartData data, _) => data.high,
              lowValueMapper: (_ChartData data, _) => data.low,
              openValueMapper: (_ChartData data, _) => data.open,
              closeValueMapper: (_ChartData data, _) => data.close,
              name: 'Stock Data',
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.high, this.low, this.open, this.close);

  final String x;
  double high;
  double low;
  double open;
  double close;
}
