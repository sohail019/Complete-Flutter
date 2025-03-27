import 'package:flutter_riverpod/flutter_riverpod.dart';

class _ChartData {
  final String x;
  final double high;
  final double low;
  final double open;
  final double close;

  _ChartData({
    required this.x,
    required this.high,
    required this.low,
    required this.open,
    required this.close,
  });
}

// Define a provider for stock data
final stockDataProvider =
    StateNotifierProvider<StockDataNotifier, List<_ChartData>>((ref) {
      return StockDataNotifier([]);
    });

class StockDataNotifier extends StateNotifier<List<_ChartData>> {
  StockDataNotifier(List<_ChartData> state) : super(state);

  // Method to update stock data
  void addStockData(_ChartData newStockData) {
    state = [...state, newStockData];
  }
}
