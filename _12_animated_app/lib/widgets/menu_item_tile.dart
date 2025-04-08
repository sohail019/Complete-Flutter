import 'package:flutter/material.dart';

class MenuItemTile extends StatefulWidget {
  final IconData icon;
  final String label;
  final Duration delay;
  final VoidCallback onTap;

  const MenuItemTile({
    super.key,
    required this.icon,
    required this.label,
    required this.delay,
    required this.onTap,
  });

  @override
  State<MenuItemTile> createState() => _MenuItemTileState();
}

class _MenuItemTileState extends State<MenuItemTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;
  late Animation<double> _iconScale;
  late Animation<int> _textAnimation;

  String get _fullText => widget.label;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500 + (_fullText.length * 50)),
    );

    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _slide = Tween<Offset>(
      begin: const Offset(-0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _iconScale = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _textAnimation = StepTween(
      begin: 0,
      end: _fullText.length,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slide,
      child: FadeTransition(
        opacity: _opacity,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _iconScale,
                  child: Icon(widget.icon, size: 32, color: Colors.white),
                ),
                const SizedBox(width: 16),
                AnimatedBuilder(
                  animation: _textAnimation,
                  builder: (context, child) {
                    return Text(
                      _fullText.substring(0, _textAnimation.value),
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
