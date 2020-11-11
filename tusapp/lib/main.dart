import 'package:flutter/material.dart';
import 'package:tusapp/home_screen.dart';
import 'package:tusapp/quiz_result_screen.dart';
import 'package:tusapp/quiz_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color _textColor = Color(0xFF535252);

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/quiz_screen': (context) => QuizScreen(),
        '/quiz_result_screen': (context) => QuizResultScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Tus App',
      theme: ThemeData(
        textTheme: TextTheme(
            headline1: TextStyle(
                color: _textColor, fontSize: 32, fontWeight: FontWeight.w400),
            headline2: TextStyle(color: _textColor, fontSize: 24),
            headline4: TextStyle(color: _textColor, fontSize: 20),
            headline6: TextStyle(color: _textColor, fontSize: 18),
            button: TextStyle(color: _textColor, fontSize: 16),
            bodyText1: TextStyle(color: _textColor, fontSize: 16),
            bodyText2: TextStyle(color: _textColor, fontSize: 12)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomeScreen(),
    );
  }
}
