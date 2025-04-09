import 'package:_12_animated_app/screens/animated_tile_screen.dart';
import 'package:_12_animated_app/screens/goals_screen.dart';
import 'package:_12_animated_app/screens/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Menu App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/tile': (context) => const AnimatedTileScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/goals': (context) => GoalScreen(),
      },
    );
  }
}
