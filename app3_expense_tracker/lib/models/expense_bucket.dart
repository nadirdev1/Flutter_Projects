import 'package:app3_expense_tracker/models/expense.dart';

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(
    List<Expense> allExpenses, this.category
  ): expenses = allExpenses.where((expense)=> expense.category == category).toList();


  final ExpenseCategory category;
  final List<Expense> expenses;



double get totalExpenses => expenses
    .where((expense) => expense.category == category) // Filtrer les dépenses par catégorie
    .map((expense) => expense.amount) // Extraire les montants
    .fold(0, (sum, amount) => sum + amount); // Calculer la somme









/*   double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      if (expense.category == category) {
        sum += expense.amount;
      }
    }

    return sum;
  }

 */

}