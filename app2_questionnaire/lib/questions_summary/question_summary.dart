import 'package:app2_questionnaire/questions_summary/question_identifier.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((data) => Row(
                    children: [
                      QuestionIdentifier(questionIndex:data['question_index'] as int,isCorrectAnswer:  true),
                      Expanded(
                        child: Column(
                          children: [
                            Text(data['question'] as String),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              data['user-answer'] as String,
                            ),
                            Text(data['correct-answer'] as String)
                          ],
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
