import 'package:flutter/material.dart';

// Understanding classes
class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              // Colors.blue,
              Colors.white,
              Colors.green,
              // Colors.yellow
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: StyledText());
  }
}

// Custom Widget for styled text\

class StyledText extends StatelessWidget {
  const StyledText({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Text(
        "Hello Sohail Shaikh!",
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
