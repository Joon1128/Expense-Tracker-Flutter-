import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd(); //  月/日/年형식

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work,
} // 중괄호 안의 값들은 다트가 인식해 문자열 값처럼 취급한다.

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

///費用クラス
///データごとのタイプを定義
class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid
           .v4(); // 클래스 속성 초기화　// uuid.v4()  --> 버전 4 uuid 랜덤생성

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formmatedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    //  외부에서 category와 expenses를 받아서 ExpensesBucket객체를 생성
    required this.category,
    required this.expenses,
  });

  //대체 생성자 함수 정의
  ExpenseBucket.forCategory(
    // 모든 Expense 리스트 중에서 해당 카테고리에 해당하는 것만 골라서 expenses로 자동 필터링
    List<Expense> allExpenses,
    this.category,
  ) : expenses = //  :   --> Initializer
      allExpenses
          .where((expense) => expense.category == category)
          .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
