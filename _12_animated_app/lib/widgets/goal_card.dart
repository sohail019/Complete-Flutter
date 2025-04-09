// goal_card.dart
import 'dart:async';
import 'package:flutter/material.dart';
import '../models/goal.dart';

class GoalCard extends StatefulWidget {
  final Goal goal;

  const GoalCard({super.key, required this.goal});

  @override
  State<GoalCard> createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  int displayedPercentage = 0;

  @override
  void initState() {
    super.initState();
    _animatePercentage();
  }

  void _animatePercentage() {
    Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (displayedPercentage < widget.goal.percentage) {
        setState(() => displayedPercentage++);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      height: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: widget.goal.color,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.goal.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
          Text(
            "\$${widget.goal.currentAmount.toInt()} of \$${widget.goal.goalAmount.toInt()}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          const SizedBox(height: 8),
          Chip(
            label: Text(widget.goal.hashtag),
            backgroundColor:
                HSLColor.fromColor(widget.goal.color)
                    .withLightness(
                      (HSLColor.fromColor(widget.goal.color).lightness - 0.1)
                          .clamp(0.0, 1.0),
                    )
                    .toColor(),
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              '$displayedPercentage%',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
