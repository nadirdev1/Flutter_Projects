import 'package:app3_expense_tracker/widgets/chart/chart.dart';
import 'package:app3_expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:app3_expense_tracker/models/expense.dart';
import 'package:app3_expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registredExpenses = [
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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      builder: (ctx) => Scaffold(
        body: NewExpense(
          onAddExpense: _addExpense,
        ),
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registredExpenses.add(expense);
    });
  }

  void _removeExpense(int index) {
    final removedExpanse = _registredExpenses[index];
    setState(() {
      _registredExpenses.removeAt(index);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registredExpenses.insert(index, removedExpanse);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = _registredExpenses.isEmpty
        ? const Center(
            child: Text("No expenses found. Start adding some!."),
          )
        : ExpensesList(
            expenses: _registredExpenses,
            onRemoveExpense: _removeExpense,
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registredExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registredExpenses)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
