import 'package:flutter/material.dart';
import 'package:app3/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({required this.expense, super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}', // 12.3433 --> 12.34修正
                ),
                Spacer(), // RowやColumnなどFlexレイアウトで、空白を作るためのWidget.
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formmatedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
