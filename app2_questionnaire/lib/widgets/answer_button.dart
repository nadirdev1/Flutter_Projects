import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required this.onPressed,
    required this.answerText,
    super.key,
  });

  final String answerText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          backgroundColor: const Color.fromARGB(255, 25, 1, 78),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      onPressed: onPressed,
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
