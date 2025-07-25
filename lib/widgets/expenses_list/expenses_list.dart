import 'package:flutter/material.dart';
import 'package:app3/widgets/expenses_list/expense_item.dart';
import 'package:app3/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext build) {
    return ListView.builder(
      itemCount: expenses.length,
      //Dismissible() --> can be dismissed by swiping them off
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(
          expenses[index],
        ), //ValueKey() --> Flutter에서 위젯을 고유하게 식별하기 위해 사용하는 키
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        }, // 제거했을때 실행되는 함수
        child: ExpenseItem(
          expense: expenses[index],
        ), // 보이는 부분
      ),
    ); //스크롤 가능한 리스트
  }
}
