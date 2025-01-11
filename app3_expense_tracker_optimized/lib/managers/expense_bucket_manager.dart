import 'package:app3_expense_tracker_optimized/models/expense.dart';
import 'package:app3_expense_tracker_optimized/models/expense_bucket.dart';

class ExpenseBucketManager {
  const ExpenseBucketManager({
    required this.expenses,
  });

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets => ExpenseCategory.values
      .map((category) => ExpenseBucket.forCategory(expenses, category))
      .toList();

  double get maxTotalExpense => buckets.fold(
      0.0,
      (currentMax, bucket) => bucket.totalExpenses > currentMax
          ? bucket.totalExpenses
          : currentMax);
}
