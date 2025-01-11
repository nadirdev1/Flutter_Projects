import 'package:app3_expense_tracker_optimized/managers/expences_manager.dart';
import 'package:app3_expense_tracker_optimized/models/expense.dart';
import 'package:app3_expense_tracker_optimized/widgets/chart/chart.dart';
import 'package:app3_expense_tracker_optimized/widgets/expenses_list/expenses_list.dart';
import 'package:app3_expense_tracker_optimized/widgets/new_expanse.dart';
import 'package:flutter/material.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expences> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const Scaffold(
        body: NewExpense(),
      ),
    ).then((value) {
      if (value == true) {
        setState(() {});
      }
    });
  }

  _undoExpenseRemove(Expense dismissedExpense, int indexExpense) {
    setState(() {
      ExpensesManager.addExpense(
        dismissedExpense,
        indexExpense,
      );
    });
  }

  void _removeExpense(int indexExpense) {
    final dismissedExpense = ExpensesManager.expenses[indexExpense];
    setState(() {
      ExpensesManager.removeExpense(dismissedExpense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () => _undoExpenseRemove(
            dismissedExpense,
            indexExpense,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget expensesListView = ExpensesManager.expenses.isEmpty
        ? const Center(
            child: Text("No expenses found. Start adding some!."),
          )
        : ExpensesList(
            expenses: ExpensesManager.expenses,
            onRemoveExpense: _removeExpense,
          );
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: screenWidth < 600
          ? Column(
              children: [
                Chart(
                  expenses: ExpensesManager.expenses,
                ),
                Expanded(
                  child: expensesListView,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: ExpensesManager.expenses),
                ),
                Expanded(
                  child: expensesListView,
                ),
              ],
            ),
    );
  }
}
