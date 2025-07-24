import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

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
