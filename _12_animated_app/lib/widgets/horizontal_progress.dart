import 'package:flutter/material.dart';

class HorizontalProgress extends StatelessWidget {
  final List<int> progressValues;
  final AnimationController controller;

  const HorizontalProgress({
    super.key,
    required this.progressValues,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(progressValues.length, (index) {
            final progress = progressValues[index];
            final animatedProgress = (controller.value * progress).clamp(
              0,
              100,
            );

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: animatedProgress.toInt(),
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 100 - animatedProgress.toInt(),
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "$animatedProgress%",
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
