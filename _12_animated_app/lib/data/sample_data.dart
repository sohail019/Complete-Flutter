import 'package:flutter/material.dart';
import '../models/goal.dart';

final List<Goal> sampleGoals = [
  Goal(
    title: "Vacation Trip",
    goalAmount: 1000,
    currentAmount: 250,
    category: "Travel",
    hashtag: "#travel",
    color: Colors.orangeAccent,
    progressByMonth: [50, 75, 125, 0],
  ),
  Goal(
    title: "New Console",
    goalAmount: 600,
    currentAmount: 300,
    category: "Gaming",
    hashtag: "#games",
    color: Colors.lightBlueAccent,
    progressByMonth: [100, 80, 120, 0],
  ),
  Goal(
    title: "Fitness Gear",
    goalAmount: 400,
    currentAmount: 100,
    category: "Fitness",
    hashtag: "#sports",
    color: Colors.pinkAccent.shade100,
    progressByMonth: [50, 30, 20, 0],
  ),
];
