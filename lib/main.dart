import 'package:flutter/material.dart';
import 'package:app3/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark,
);
void main() {
  runApp(
    MaterialApp(
      darkTheme:
          /// ThemeMode.dark
          ThemeData.from(
            useMaterial3: true,
            colorScheme: kDarkColorScheme,
          ).copyWith(
            cardTheme: CardThemeData(
              color: kDarkColorScheme
                  .secondaryContainer, //카드배경
              margin: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    kDarkColorScheme.primaryContainer,
                foregroundColor:
                    kDarkColorScheme.onPrimaryContainer,
              ),
            ),
          ),
      theme: ThemeData(
        //  ThemeMode.light
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          //AppBarのTheme
          backgroundColor:
              kColorScheme.onPrimaryContainer, // 앱바 배경색
          foregroundColor:
              kColorScheme.primaryContainer, // 앱바 텍스트,아이콘 색
        ),
        cardTheme: CardThemeData(
          color: kColorScheme.secondaryContainer, //카드배경
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
      ),
      themeMode: ThemeMode.dark, //default

      home: Expenses(),
    ),
  );
}
