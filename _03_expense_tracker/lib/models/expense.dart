import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();


//? enum allows to create custom data types
enum Category { leisure, food, transport, bills, work, others }

const categoryIcons = {
  Category.leisure: Icons.local_movies,
  Category.food: Icons.lunch_dining,
  Category.transport: Icons.directions_bus,
  Category.bills: Icons.receipt,
  Category.work: Icons.work,
  Category.others: Icons.shopping_cart,
};

class Expense {
  Expense({required this.title, required this.amount, required this.date, required this.category})
    : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category; // leisure Expense (category: 'lesure')

  String get formattedDate {
    return formatter.format(date);
  }
}
