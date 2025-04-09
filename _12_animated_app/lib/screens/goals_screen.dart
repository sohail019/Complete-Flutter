import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/goal_card.dart';
import '../models/goal.dart';

class GoalScreen extends StatelessWidget {
  final List<Goal> goals = [
    Goal(
      title: 'Mountain Bike',
      category: 'sport',
      currentAmount: 180,
      goalAmount: 300,
      color: Colors.pink.shade100,
      hashtag: '#sport',
    ),
    Goal(
      title: 'Sony Playstation 5',
      category: 'game',
      currentAmount: 144,
      goalAmount: 800,
      color: Colors.blue.shade100,
      hashtag: '#game',
    ),
    Goal(
      title: 'Buffy Nature Skateboard',
      category: 'entertainment',
      currentAmount: 240,
      goalAmount: 240,
      color: Colors.yellow.shade100,
      hashtag: '#entertainment',
    ),
  ];

  final double cardHeight = 220.0;
  final double overlap = 22.0;

  GoalScreen({super.key}); // 10% overlap

  @override
  Widget build(BuildContext context) {
    final double totalHeight =
        (goals.length - 1) * (cardHeight - overlap) + cardHeight;

    return Scaffold(
      backgroundColor: const Color(0xFFEAEFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Goals',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, size: 28),
                      onPressed: () {},
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Lottie.asset(
                    'assets/Lottie/cat.json',
                    height: 160,
                    width: 220,
                    repeat: true,
                    reverse: true,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: totalHeight,
                  child: Stack(
                    children:
                        goals.asMap().entries.map((entry) {
                          int index = entry.key;
                          Goal goal = entry.value;

                          double scale = 1.0 - (index * 0.03);

                          return Positioned(
                            top: index * (cardHeight - overlap),
                            left: 0,
                            right: 0,
                            child: Transform(
                              alignment: Alignment.topCenter,
                              transform:
                                  Matrix4.identity()
                                    ..scale(scale, scale)
                                    ..setEntry(3, 2, 0.001)
                                    ..rotateX(-0.1),
                              child: GoalCard(goal: goal),
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
