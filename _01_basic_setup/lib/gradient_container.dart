import 'package:_01_basic_setup/dice_roller.dart';
import 'package:flutter/material.dart';
import 'package:_01_basic_setup/styled_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      // child: StyledText("Hello Sohail!"),
      child: Center(child: DiceRoller()),
    );
  }
}
