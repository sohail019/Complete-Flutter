import 'package:_08_boi_poka/screens/home/main_tab_view/main_tab_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndexHomeProvider = StateProvider<int>((ref) => 0);

final homeScreenTabsProvider = Provider<List<Widget>>((ref) {
  return [
    MainTabViewScreen(),
    Container(
      alignment: Alignment.center,
      color: Colors.green,
      child: Center(child: Text("Analytics Screen")),
    ),
    Container(
      alignment: Alignment.center,
      color: Colors.blue,
      child: Center(child: Text("Share Books Screen")),
    ),
    Container(
      alignment: Alignment.center,
      color: Colors.yellow,
      child: Center(child: Text("BooksWorms Screen")),
    ),
  ];
});
