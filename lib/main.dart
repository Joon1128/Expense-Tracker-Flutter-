import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 앱의 화면 방향을 잠근다.
import 'package:app3/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark,
);
void main() {
  WidgetsFlutterBinding.ensureInitialized(); //SystemChrome 관련 설정 전 반드시 호출해야 하는 함수
  SystemChrome.setPreferredOrientations(
    // Future반환하므로 runApp을 실행하려면 .then으로 감싸야한다.
    //앱의 화면방향 제한
    // 선호되는 방향 설정
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ], //세로 정방향만 허용
  ).then((fn) {
    // ・ .then（...）{ } 작업이 끝났을 때 실행할 코드 등록
    // runApp = 앱을 실행하는 함수
    // 화면 회전 제한 설정이 끝난 다음에 runApp이 실행 되어야 한다.
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
            foregroundColor: kColorScheme
                .primaryContainer, // 앱바 텍스트,아이콘 색
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
              backgroundColor:
                  kColorScheme.primaryContainer,
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
        themeMode: ThemeMode.light, //default

        home: Expenses(),
      ),
    );
  });
}
