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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              // Theme.of(context) --> 앱 전체에 설정된 ThemeData를 가져온다.
              // .textTheme --->그 중에서 글꼴 스타일 묶음인 TextTheme에 접근한다.
              // .titleLarge ---> 그 TextTheme안에 미리 정의된 스타일 중 하나
              style: Theme.of(context).textTheme.titleLarge,
            ),
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
