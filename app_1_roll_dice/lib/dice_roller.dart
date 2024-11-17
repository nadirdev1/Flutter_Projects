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
  var currentDiceroll1 = 2;
  var currentDiceroll2 = 3;

  void rollDice() {
    setState(() {
      currentDiceroll1 = randomizer.nextInt(6) + 1;
      currentDiceroll2 = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceroll1.png',
          width: 200,
        ),
                Image.asset(
          'assets/images/dice-$currentDiceroll2.png',
          width: 200,
        ),
        
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle:  const TextStyle(fontSize: 28,)
          ),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}
