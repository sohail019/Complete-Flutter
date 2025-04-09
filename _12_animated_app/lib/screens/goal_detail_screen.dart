import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/goal.dart';

class GoalDetailScreen extends StatefulWidget {
  final Goal goal;

  const GoalDetailScreen({super.key, required this.goal});

  @override
  State<GoalDetailScreen> createState() => _GoalDetailScreenState();
}

class _GoalDetailScreenState extends State<GoalDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bgHeightAnimation;
  late Animation<Offset> _slideInAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _bgHeightAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _slideInAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildBottomCard(double screenHeight) {
    return SlideTransition(
      position: _slideInAnimation,
      child: Container(
        height: screenHeight * 0.5, // Half of screen
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.green, // Different from goal card color
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: const Offset(0, -4),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.goal.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Category: ${widget.goal.category}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "\$${widget.goal.currentAmount} saved of \$${widget.goal.goalAmount}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Chip(
              label: Text(widget.goal.hashtag),
              backgroundColor: widget.goal.color.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Stack(
            children: [
              // Background expanding
              Container(
                height: _bgHeightAnimation.value * screenHeight,
                width: double.infinity,
                color: widget.goal.color,
              ),

              // Lottie animation
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: Center(
                  child: Lottie.asset(
                    'assets/Lottie/cat.json',
                    height: 150,
                    reverse: true,
                  ),
                ),
              ),
              // Horizontal progress bars with labels
              Positioned(
                top: 250,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Progress",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: List.generate(3, (index) {
                        final progress =
                            (index + 1) *
                            (10 + (index * 10)); // Random-like progress
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: AnimatedBuilder(
                            animation: _controller,
                            builder: (_, __) {
                              final animatedProgress =
                                  (_controller.value * progress).clamp(0, 100);
                              return Row(
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
                                    "${animatedProgress.toInt()}%",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),

              // Bottom detail card
              Align(
                alignment: Alignment.bottomCenter,
                child: buildBottomCard(screenHeight),
              ),

              // Back button
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, size: 28),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
