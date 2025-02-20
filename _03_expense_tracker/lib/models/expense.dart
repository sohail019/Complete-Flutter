import 'package:uuid/uuid.dart';

const uuid = Uuid();

//? enum allows to create custom data types
enum Category { leisure, food, transport, bills, work, others }

class Expense {
  Expense({required this.title, required this.amount, required this.date, required this.category})
    : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category; // leisure Expense (category: 'lesure')
}
