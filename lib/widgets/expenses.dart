import 'package:app3/widgets/expenses_list/expenses_list.dart';
import 'package:app3/widgets/new_expense.dart';
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

  void _openAddExpenseOverlay() {
    // builder --> 기본으로 호출하는 함수를 제공해야한다.
    showModalBottomSheet(
      isScrollControlled:
          true, // 전체화면까지 시트 높이 확장.  false의 경우 5-60%
      context: context,
      // isScrollControlled: true, // 키보드 충돌 방지
      builder: (ctx) =>
          NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(
      expense,
    );
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(
      context,
    ).clearSnackBars(); // 기존에 떠있던 SnackBar제거
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(
                expenseIndex,
                expense,
              );
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter ExpenseTracker '),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('The chart'),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
