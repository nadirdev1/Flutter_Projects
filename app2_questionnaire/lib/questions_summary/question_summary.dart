import 'package:app2_questionnaire/questions_summary/summary_item.dart';
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
              .map((data) => SummaryItem(itemData: data))
              .toList(),
        ),
      ),
    );
  }
}
