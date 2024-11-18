import 'package:app2_questionnaire/data/questions.dart';
import 'package:app2_questionnaire/questions_summary/question_summary.dart';

import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.switchScreen,
  });

  final List<String> chosenAnswers;
  final VoidCallback switchScreen;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [
      for (var i = 0; i < chosenAnswers.length; i++)
        {
          'question_index': i,
          'question': questions[i].text,
          'correct-answer': questions[i].answers[0],
          'user-answer': chosenAnswers[i],
        },
    ];

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final correctQuestions = summaryData
        .where((entry) => entry['user-answer'] == entry['correct-answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You answered $correctQuestions of $numTotalQuestions questions correctly!"),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData: summaryData),
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
