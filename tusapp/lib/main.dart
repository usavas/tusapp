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
          button: TextStyle(color: Color(0xFF535252), fontSize: 18),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
