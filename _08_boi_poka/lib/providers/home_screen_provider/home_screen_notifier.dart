import 'package:_08_boi_poka/screens/analytics_screen/analytics_screen.dart';
import 'package:_08_boi_poka/screens/home/main_tab_view/main_tab_view_screen.dart';
import 'package:_08_boi_poka/screens/stock_chart_screen/stock_chart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndexHomeProvider = StateProvider<int>((ref) => 0);

final homeScreenTabsProvider = Provider<List<Widget>>((ref) {
  return [
    MainTabViewScreen(),
    AnalyticsScreen(),
    StockChartScreen(),
    Container(
      alignment: Alignment.center,
      color: Colors.yellow,
      child: Center(child: Text("BooksWorms Screen")),
    ),
  ];
});
