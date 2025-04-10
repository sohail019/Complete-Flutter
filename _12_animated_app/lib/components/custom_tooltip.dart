import 'package:flutter/material.dart';

class CustomTooltip extends StatefulWidget {
  final Widget child;
  final String message;
  final Duration duration;

  const CustomTooltip({
    Key? key,
    required this.child,
    required this.message,
    this.duration = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  State<CustomTooltip> createState() => CustomTooltipState();
}

class CustomTooltipState extends State<CustomTooltip> {
  bool _isVisible = false;

  void showTooltip() {
    setState(() {
      _isVisible = true;
    });

    Future.delayed(widget.duration, () {
      if (mounted) {
        setState(() {
          _isVisible = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        widget.child,
        if (_isVisible)
          Positioned(
            top: -40,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
