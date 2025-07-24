import 'package:app3/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:app3/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  // @override // 상태를 관리할 클래스 연결
  // State<Expenses> createState() {
  //   return _ExpensesState();
  // }

  @override //上記と同様
  State<Expenses> createState() => _ExpensesState();
}

//  상태를 정의하는 클래스
class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('The chart'),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
            ),
          ),
        ],
      ),
    );
  }
}
