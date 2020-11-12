import 'package:flutter/material.dart';
import 'package:tusapp/crosscutting/consts.dart';
import 'package:tusapp/main_screens/home_screen.dart';
import 'package:tusapp/past_years_exams_screen.dart';
import 'package:tusapp/quiz_result_screen.dart';
import 'package:tusapp/question_screens/question_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/past_years_questions_screen': (context) => PastYearsExamsScreen(),
        '/quiz_screen': (context) => QuestionScreen(),
        '/quiz_result_screen': (context) => QuizResultScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Tus App',
      theme: ThemeData(
        textTheme: TextTheme(
            headline1: TextStyle(
                color: kDefaultTextColor,
                fontSize: 32,
                fontWeight: FontWeight.w400),
            headline2: TextStyle(color: kDefaultTextColor, fontSize: 24),
            headline4: TextStyle(color: kDefaultTextColor, fontSize: 20),
            headline6: TextStyle(color: kDefaultTextColor, fontSize: 18),
            button: TextStyle(color: kDefaultTextColor, fontSize: 16),
            bodyText1: TextStyle(color: kDefaultTextColor, fontSize: 16),
            bodyText2: TextStyle(color: kDefaultTextColor, fontSize: 12)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kCardBorderRadius))),
      ),
    );
  }
}
