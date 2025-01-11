import 'package:app3_expense_tracker_optimized/global/layout_constants.dart';
import 'package:app3_expense_tracker_optimized/managers/expense_bucket_manager.dart';
import 'package:app3_expense_tracker_optimized/models/expense.dart';
import 'package:app3_expense_tracker_optimized/widgets/chart/chart_bar.dart';

import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  Chart({
    required this.expenses,
    super.key,
  }) : expenseBucketManager = ExpenseBucketManager(expenses: expenses);

  final List<Expense> expenses;
  final ExpenseBucketManager expenseBucketManager;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      width: double.infinity,
      height: 180,
      margin: LayoutConstants.all16,
      padding: LayoutConstants.sym8H_16V,
      decoration: BoxDecoration(
        borderRadius: LayoutConstants.borderRadiusAll8,
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Row(
        children: expenseBucketManager.buckets
            .where((bucket) => bucket.totalExpenses > 0)
            .map(
              (bucket) => Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ChartBar(
                        fill: bucket.totalExpenses /
                            (expenseBucketManager.maxTotalExpense == 0
                                ? 1
                                : expenseBucketManager.maxTotalExpense),
                        totalExpenses:
                            bucket.totalExpenses, // Passe les dépenses
                      ),
                    ),
                    const SizedBox(height: 12),
                    Icon(
                      categoryIcons[bucket.category],
                      color: isDarkMode
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.7),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${bucket.totalExpenses.toStringAsFixed(2)} CHF",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
