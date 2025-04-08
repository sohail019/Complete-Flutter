import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedCardTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isVisible;
  final Color color;
  final Duration animationDelay;
  final int index;

  const AnimatedCardTile({
    required this.title,
    required this.subtitle,
    required this.isVisible,
    required this.color,
    required this.animationDelay,
    required this.index,
    super.key,
  });

  @override
  State<AnimatedCardTile> createState() => _AnimatedCardTileState();
}

class _AnimatedCardTileState extends State<AnimatedCardTile>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _flipAnim;
  late final Animation<double> _scaleAnim;
  late final Animation<Offset> _slideAnim;

  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _flipAnim = Tween(
      begin: -math.pi / 2,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _scaleAnim = Tween(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnim = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Animate in after build
    if (widget.isVisible) {
      if (widget.animationDelay == Duration.zero) {
        _controller.forward();
        _isVisible = true;
      } else {
        Future.delayed(widget.animationDelay, () {
          if (mounted && widget.isVisible) {
            _controller.forward();
            _isVisible = true;
          }
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedCardTile oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isVisible && !_isVisible) {
      _controller.forward();
      _isVisible = true;
    } else if (!widget.isVisible && _isVisible) {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (mounted && !widget.isVisible) {
          _controller.reverse();
          _isVisible = false;
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.centerRight,
          transform:
              Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(_flipAnim.value),
          child: SlideTransition(
            position: _slideAnim,
            child: Transform.scale(scale: _scaleAnim.value, child: child),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          color: widget.color,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Icon(Icons.star, size: 36, color: Colors.white),
                const SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
