import 'package:app3_expense_tracker_optimized/models/expense.dart';

class ExpensesManager {
  static final List<Expense> _registredExpenses = [
    Expense(
      title: 'David LLoyd',
      amount: 164,
      date: DateTime.now(),
      category: ExpenseCategory.sport,
    ),
    Expense(
      title: 'Leclerc',
      amount: 59.50,
      date: DateTime.now(),
      category: ExpenseCategory.food,
    ),
    Expense(
      title: 'Cinema',
      amount: 10.20,
      date: DateTime.now(),
      category: ExpenseCategory.leisure,
    ),
  ];

  // Récupérer toutes les dépenses
  static List<Expense> get expenses => List.unmodifiable(_registredExpenses);

  // Ajouter une nouvelle dépense
  static void addExpense(Expense expense, [int? index]) {
    if (index != null && index >= 0 && index <= _registredExpenses.length) {
      // Insère l'expense à l'index spécifié
      _registredExpenses.insert(index, expense);
    } else {
      // Ajoute l'expense à la fin de la liste si aucun index valide n'est fourni
      _registredExpenses.add(expense);
    }
  }

  // Supprimer une dépense
  static void removeExpense(Expense expense) {
    _registredExpenses.remove(expense);
  }

  // Filtrer les dépenses par catégorie
  static List<Expense> filterByCategory(ExpenseCategory category) {
    return _registredExpenses
        .where((expense) => expense.category == category)
        .toList();
  }

  // Calculer le total des dépenses
  static double get totalExpenses {
    return _registredExpenses.fold(0.0, (sum, expense) => sum + expense.amount);
  }

  // Récupérer les dépenses par mois
  static Map<String, List<Expense>> get expensesByMonth {
    Map<String, List<Expense>> groupedExpenses = {};

    for (var expense in _registredExpenses) {
      print(expense.date);
      String month = "${expense.date.month}-${expense.date.year}";
      groupedExpenses.putIfAbsent(month, () => []).add(expense);
    }

    return groupedExpenses;
  }
}
