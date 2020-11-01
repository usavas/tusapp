import 'package:flutter/material.dart';
import 'package:tusapp/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tus App',
      theme: ThemeData(
        textTheme: TextTheme(
            headline2: TextStyle(color: Color(0xFF535252), fontSize: 24),
            headline4: TextStyle(color: Color(0xFF535252), fontSize: 20),
            headline6: TextStyle(color: Color(0xFF535252), fontSize: 18),
            button: TextStyle(color: Color(0xFF535252), fontSize: 16),
            bodyText1: TextStyle(color: Color(0xFF535252), fontSize: 16),
            bodyText2: TextStyle(color: Color(0xFF535252), fontSize: 12)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
