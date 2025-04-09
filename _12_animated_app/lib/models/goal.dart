// models/goal.dart
import 'package:flutter/material.dart';

class Goal {
  final String title;
  final String category;
  final double currentAmount;
  final double goalAmount;
  final Color color;
  final String hashtag;
  final int currentMonth;

  Goal({
    required this.title,
    required this.category,
    required this.currentAmount,
    required this.goalAmount,
    required this.color,
    required this.hashtag,
    required this.currentMonth,
  });

  int get percentage =>
      ((currentAmount / goalAmount) * 100).clamp(0, 100).toInt();
}
