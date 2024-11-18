import 'package:app2_questionnaire/data/questions.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.switchScreen,
  });

  final List<String> chosenAnswers;
  final void Function() switchScreen;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [
      for (var i = 0; i < chosenAnswers.length; i++)
        {
          'question_index': i,
          'question': questions[i],
          'correctAnswer': questions[i].answers[0],
          'chosenAnswer': chosenAnswers[i],
        },
    ];

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You answered X of Y questions correctly!"),
            const SizedBox(
              height: 30,
            ),
            const Text("List of answers and questions..."),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: switchScreen, child: const Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
