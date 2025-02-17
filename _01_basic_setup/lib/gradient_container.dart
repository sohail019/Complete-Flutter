import 'package:flutter/material.dart';
import 'package:_01_basic_setup/styled_text.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

// Understanding classes
class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              // Colors.blue,
              Colors.white,
              Colors.green,
              // Colors.yellow
            ],
            begin: startAlignment,
            end: endAlignment,
          ),
        ),
        child: StyledText());
  }
}
