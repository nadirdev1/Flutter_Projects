import 'package:app3_expense_tracker_optimized/models/expense.dart';

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(
    List<Expense> allExpenses,
    this.category,
  ) : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpenses => expenses
      .where((expense) => expense.category == category)
      .map((expense) => expense.amount)
      .fold(0, (sum, amount) => sum + amount);

  final ExpenseCategory category;
  final List<Expense> expenses;
}
