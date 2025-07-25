import 'package:flutter/material.dart';
import 'package:app3/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(
          255,
          220,
          189,
          252,
        ),
      ),
      home: Expenses(),
    ),
  );
}
