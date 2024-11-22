
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final dateFormattert = DateFormat.yMMMd();

enum ExpenseCategory { food, travel, leisure, work, sport}
const categoryIcons = {
  ExpenseCategory.food : Icons.lunch_dining,
  ExpenseCategory.travel: Icons.flight_takeoff,
  ExpenseCategory.leisure: Icons.sports_bar,
  ExpenseCategory.work: Icons.work,
  ExpenseCategory.sport: Icons.fitness_center,
};


class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }):  id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;


String get formattedDate => dateFormattert.format(date);

}


