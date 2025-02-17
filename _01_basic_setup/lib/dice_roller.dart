import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;
  var isLoading = false;

  rollDice() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
      isLoading = false;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isLoading)
          const CircularProgressIndicator()
        else
          Image.asset(
            'assets/images/dice-$currentDiceRoll.png',
            width: 200,
          ),
        const SizedBox(height: 20),
        Text(
          'You rolled: $currentDiceRoll',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: rollDice,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
