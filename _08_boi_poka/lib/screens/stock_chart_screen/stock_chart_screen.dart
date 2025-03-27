import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

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

  final int maxDataPoints = 5;

  @override
  void initState() {
    super.initState();
    data = [];

    _tooltip = TooltipBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      header: '',
      canShowMarker: false,
      format: 'point.x: point.open \npoint.y: point.close',
    );
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipSettings: InteractiveTooltip(
        enable: true,
        format: 'point.x: point.open \npoint.y: point.close',
      ),
    );

    socket = io.io(
      'http://192.168.255.153:3000', // Replace with your server IP
      io.OptionBuilder().setTransports(['websocket']).build(),
    );

    socket.on('connect', (_) {
      print('Connected to server');
    });

    // Listen for stock updates from the server
    socket.on('stock_update', (stockData) {
      print('Received stock data: $stockData');
      if (mounted) {
        setState(() {
          // Add new data with timestamp as X value
          data.add(
            _ChartData(
              DateTime.now().millisecondsSinceEpoch
                  .toString(), // Use timestamp as X value
              stockData['high'].toDouble(),
              stockData['low'].toDouble(),
              stockData['open'].toDouble(),
              stockData['close'].toDouble(),
            ),
          );

          // Limit the number of candles to `maxDataPoints`
          if (data.length > maxDataPoints) {
            data.removeAt(
              0,
            ); // Remove the oldest data point to make room for the new one
          }
        });
      }
    });

    socket.on('disconnect', (_) {
      print('Disconnected from WebSocket');
    });
  }

  @override
  void dispose() {
    socket.disconnect(); // Disconnect the socket when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Stock Chart")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            isInversed: false,
            interval: 1, // Each data point will have an interval of 1
            labelRotation: 45,
          ),
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
          zoomPanBehavior: ZoomPanBehavior(
            enableMouseWheelZooming: true,
            enablePinching: true,
            enablePanning: true,
          ),
          series: <CartesianSeries<_ChartData, String>>[
            CandleSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              highValueMapper: (_ChartData data, _) => data.high,
              lowValueMapper: (_ChartData data, _) => data.low,
              openValueMapper: (_ChartData data, _) => data.open,
              closeValueMapper: (_ChartData data, _) => data.close,
              name: 'Stock Data',
              borderWidth: 1,
              // borderColor: Colors.black,
              emptyPointSettings: EmptyPointSettings(
                mode: EmptyPointMode.zero,
                borderWidth: 1,
                borderColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.high, this.low, this.open, this.close);

  final String x; // X-axis value (e.g., timestamp)
  final double high; // Highest price of the stock
  final double low; // Lowest price of the stock
  final double open; // Opening price of the stock
  final double close; // Closing price of the stock
}
