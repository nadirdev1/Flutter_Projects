import 'package:app3_expense_tracker_optimized/managers/expences_manager.dart';
import 'package:app3_expense_tracker_optimized/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMMMd();

class NewExpense extends StatefulWidget {
  const NewExpense({
    // required this.onAddExpense,
    super.key,
  });

  // final void Function(Expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  //DROPDOWNMENU ExpenseCategory
  ExpenseCategory? _selectedCategory;

  void _onChangedCategory(ExpenseCategory? value) {
    setState(() {
      _selectedCategory = value;
    });
  }

  //_____________________________________________________________
  //_____________________________________________________________

  //TEXTFIELD CONTROLERS AND FOCUSNODES_________________________________________
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  final _titleFocusNode = FocusNode();
  final _amountFocusNode = FocusNode();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();

    _titleFocusNode.dispose();
    _amountFocusNode.dispose();

    super.dispose();
  }
  //_____________________________________________________________
  //_____________________________________________________________

  //DATE PICKER CONFIG___________________________________________
  DateTime? _selectedDate = DateTime.now();
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    if (pickedDate is DateTime) {
      setState(
        () {
          _selectedDate = pickedDate;
        },
      );
    }
  }
  //_____________________________________________________________
  //_____________________________________________________________

  void _onCloseNewExpense() {
    Navigator.of(context).pop(true);
  }

  void _onSubmitNewExpense() {
    final expense = _validateData();
    if (expense != null) {
      ExpensesManager.addExpense(expense);
      _onCloseNewExpense();
    }
  }

  Expense? _validateData() {
    final title = _titleController.text;
    if (title.trim().isEmpty) {
      _showCustomErrorDialog("Please enter a title.");
      _titleFocusNode.requestFocus();
      return null;
    }
    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      _showCustomErrorDialog("Please enter a valid amount.");
      _amountFocusNode.requestFocus();
      return null;
    }

    if (_selectedCategory == null) {
      _showCustomErrorDialog("Please select a Category.");
      _showErrorSnackBar("please choose category");
      return null;
    }
    final expense = Expense(
      title: title,
      amount: amount,
      date: _selectedDate!,
      category: _selectedCategory!,
    );
    return expense;
  }

  void _showCustomErrorDialog(String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              Icons.error,
              color: Theme.of(context).colorScheme.errorContainer,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Erreur',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("close"),
          ),
        ],
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle().copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          16,
          50,
          16,
          16,
        ),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              focusNode: _titleFocusNode,
              keyboardType: TextInputType.text,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _amountController,
                    focusNode: _amountFocusNode,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      // label: Text('amout'),
                      labelText: "amournt",
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        dateFormatter.format(
                          _selectedDate!,
                        ),
                        style:
                            Theme.of(context).inputDecorationTheme.labelStyle,
                      ),
                      IconButton(
                        alignment: Alignment.bottomCenter,
                        onPressed: _presentDatePicker,
                        icon: const Icon(
                          Icons.calendar_month,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<ExpenseCategory>(
                  value: _selectedCategory,
                  items: [
                    const DropdownMenuItem(
                      value: null,
                      child: Text(
                        "select category",
                      ),
                    ),
                    ...ExpenseCategory.values.map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                  ],
                  onChanged: _onChangedCategory,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: _onCloseNewExpense,
                      child: const Text('cancel'),
                    ),
                    ElevatedButton(
                      onPressed: _onSubmitNewExpense,
                      child: const Text('save expense'),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
