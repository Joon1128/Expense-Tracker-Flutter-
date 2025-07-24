import 'package:flutter/material.dart';
import 'package:app3/widgets/expenses_list/expense_item.dart';
import 'package:app3/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext build) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) =>
          ExpenseItem(expense: expenses[index]),
    ); //스크롤 가능한 리스트
  }
}
