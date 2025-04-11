import 'dart:async';
import 'package:_12_animated_app/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/goal.dart';

class GoalDetailScreen extends StatefulWidget {
  final Goal goal;
  final Offset cardOffset;
  final Size cardSize;

  const GoalDetailScreen({
    super.key,
    required this.goal,
    required this.cardOffset,
    required this.cardSize,
  });

  @override
  State<GoalDetailScreen> createState() => _GoalDetailScreenState();
}

class _GoalDetailScreenState extends State<GoalDetailScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _bottomCardController;
  late AnimationController _contentController;
  late AnimationController _catController;

  late Animation<double> _bgHeightAnimation;
  late Animation<Offset> _bottomSlideAnimation;
  late Animation<Offset> _contentSlideAnimation;
  late Animation<double> _contentFadeAnimation;
  late Animation<double> _catScaleAnimation;

  int displayedPercentage = 0;
  bool _isMessageVisible = false;

  @override
  void initState() {
    super.initState();

    _animatePercentage();

    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _bottomCardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _contentController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _catController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _bgHeightAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeOutCubic),
    );

    _bottomSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _bottomCardController, curve: Curves.easeOut),
    );

    _contentSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _contentController, curve: Curves.easeOut),
    );

    _contentFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _contentController, curve: Curves.easeIn),
    );

    _catScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _catController, curve: Curves.elasticOut),
    );

    Future.delayed(const Duration(milliseconds: 700), () {
      _catController.forward();
    });

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await _mainController.forward(); // Background first
    await _bottomCardController.forward(); // Bottom card slide
    await Future.delayed(const Duration(milliseconds: 200));
    await _catController.forward(); // Cat scale
    await _contentController.forward(); // Content slide + fade
  }

  Future<void> _handleExitAnimation() async {
    // Play the exit animations
    await _contentController.reverse();
    await _catController.reverse();
    await Future.delayed(
      const Duration(milliseconds: 100),
    ); // Re-enable the delay
    await _bottomCardController.reverse();
    await _mainController.reverse();
  }

  @override
  void dispose() {
    _mainController.dispose();
    _bottomCardController.dispose();
    _contentController.dispose();
    _catController.dispose();
    super.dispose();
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

  Widget buildBottomCard(double screenHeight) {
    return SlideTransition(
      position: _bottomSlideAnimation,
      child: Container(
        height: screenHeight * 0.5,
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.green.shade800,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: const Offset(0, -4),
              blurRadius: 20,
            ),
          ],
        ),
        child: FadeTransition(
          opacity: _contentFadeAnimation,
          child: SlideTransition(
            position: _contentSlideAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                const Text(
                  "Amount Collected",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 16),
                Text(
                  "\$${widget.goal.currentAmount} of \$${widget.goal.goalAmount}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 75),
                Text(
                  widget.goal.title.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 56,
                    fontFamily: 'LuckiestGuy',
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1.5,
                    height: 1.2,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        // if (didPop) {
        //   _handleExitAnimation().then((_) {
        //     Navigator.of(context).pop();
        //   });
        // } else {
        //   _mainController.reverse().then((_) {
        //     Navigator.of(context).pop();
        //   });
        // }
        await _handleExitAnimation(); // Ensure animations complete
        return null;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedBuilder(
          animation: _mainController,
          builder: (_, __) {
            return Stack(
              children: [
                // Background expanding
                // Container(
                //   height: _bgHeightAnimation.value * screenHeight,
                //   width: double.infinity,
                //   color: widget.goal.color,
                // ),
                Positioned(
                  left: 0,
                  right: 0,
                  top:
                      widget.cardOffset.dy +
                      widget.cardSize.height / 2 -
                      (_bgHeightAnimation.value * widget.cardSize.height / 2),
                  height:
                      _bgHeightAnimation.value *
                      MediaQuery.of(context).size.height,
                  child: Container(color: widget.goal.color),
                ),

                // Top row
                // if (_contentFadeAnimation.value > 0)
                Positioned(
                  top: 80,
                  left: 20,
                  right: 20,
                  child: FadeTransition(
                    opacity: _contentFadeAnimation,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            '$displayedPercentage%',
                            style: const TextStyle(
                              fontSize: 56,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'LuckiestGuy',
                            ),
                          ),
                        ),

                        CustomButton(
                          onPressed: () {
                            // Add your replenish logic here
                            _catController.reverse().then((_) {
                              _catController.forward();
                            });

                            // Show the message
                            setState(() {
                              _isMessageVisible = true;
                            });

                            // Hide the message after 2 seconds
                            Future.delayed(const Duration(seconds: 2), () {
                              if (mounted) {
                                setState(() {
                                  _isMessageVisible = false;
                                });
                              }
                            });
                          },
                          text: "Wake me up",
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ],
                    ),
                  ),
                ),

                // Horizontal progress bars
                // Positioned(
                //   top: 250,
                //   left: 20,
                //   right: 20,
                //   child: HorizontalProgress(
                //     progressValues: widget.goal.progressByMonth,
                //     controller: _mainController,
                //   ),
                // ),

                // Bottom detail card
                Align(
                  alignment: Alignment.bottomCenter,
                  child: buildBottomCard(screenHeight),
                ),

                // Cat animation
                Positioned(
                  bottom: screenHeight * 0.5 - 110,
                  right: 30,
                  child: GestureDetector(
                    onTap: () {
                      // Trigger the cat animation
                      _catController.reverse().then((_) {
                        _catController.forward();
                      });

                      // Show the message
                      setState(() {
                        _isMessageVisible = true;
                      });

                      // Hide the message after 2 seconds
                      Future.delayed(const Duration(seconds: 2), () {
                        if (mounted) {
                          setState(() {
                            _isMessageVisible = false;
                          });
                        }
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior:
                          Clip.none, // Ensure the message is not clipped
                      children: [
                        // Cat animation
                        ScaleTransition(
                          scale: _catScaleAnimation,
                          child: RotationTransition(
                            turns: Tween<double>(begin: 0, end: 1).animate(
                              CurvedAnimation(
                                parent: _catController,
                                curve: Curves.easeInOut,
                              ),
                            ),
                            child: Lottie.asset(
                              'assets/Lottie/cat_sleeping.json',
                              height: 230,
                              reverse: true,
                            ),
                          ),
                        ),
                        // Message overlay
                        if (_isMessageVisible)
                          Positioned(
                            top: -10, // Position the message above the cat
                            child: Material(
                              color: Colors.transparent,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  "Please, let me sleep",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'LuckiestGuy',
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                // Back button
                Positioned(
                  top: 40,
                  left: 5,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, size: 28),
                    onPressed: () async {
                      await _handleExitAnimation(); // Ensure animations complete
                      if (mounted) {
                        Navigator.of(context).pop(); // Pop the screen
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
