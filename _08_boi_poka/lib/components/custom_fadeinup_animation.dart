import 'package:flutter/material.dart';

class CustomFadeinupAnimation extends StatefulWidget {
  final int animationDuration;
  final double slideOffsetDistance;
  final int delay;
  final Widget child;

  const CustomFadeinupAnimation({
    super.key,
    this.animationDuration = 500,
    this.slideOffsetDistance = 0.2,
    this.delay = 800,
    required this.child,
  });

  @override
  State<CustomFadeinupAnimation> createState() =>
      _CustomFadeinupAnimationState();
}

class _CustomFadeinupAnimationState extends State<CustomFadeinupAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration),
    );

    _initializeAnimations();

    _startAnimation();
  }

  void _initializeAnimations() {
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, widget.slideOffsetDistance),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  void _startAnimation() async {
    if (mounted) {
      await Future.delayed(Duration(milliseconds: widget.delay));
      if (mounted) {
        _animationController.forward(from: 0.0);
      }
    }
  }

  @override
  void didUpdateWidget(covariant CustomFadeinupAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Restart animation only if animation-related properties change
    if (oldWidget.animationDuration != widget.animationDuration ||
        oldWidget.slideOffsetDistance != widget.slideOffsetDistance ||
        oldWidget.delay != widget.delay) {
      _initializeAnimations();
      _startAnimation();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: widget.child,
      ),
    );
  }
}
