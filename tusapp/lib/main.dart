import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tusapp/crosscutting/consts.dart';
import 'package:tusapp/main_screens/home_screen.dart';
import 'package:tusapp/main_screens/past_years_exams_screen.dart';
import 'package:tusapp/quiz_screens/quiz_result_screen.dart';
import 'package:tusapp/quiz_screens/quiz_screen.dart';

import 'loading_screen.dart';
import 'something_went_wrong_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initializeFirebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeFirebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return SomethingWentWrongScreen(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              initialRoute: '/',
              routes: {
                '/': (context) => HomeScreen(),
                PastYearsExamsScreen.routeName: (context) =>
                    PastYearsExamsScreen(),
                QuizScreen.routeName: (context) => QuizScreen(),
                QuizResultScreen.routeName: (context) => QuizResultScreen(),
              },
              debugShowCheckedModeBanner: false,
              title: 'Tus App',
              theme: ThemeData(
                textTheme: TextTheme(
                    headline1: TextStyle(
                        color: kDefaultTextColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w400),
                    headline2:
                        TextStyle(color: kDefaultTextColor, fontSize: 24),
                    headline4:
                        TextStyle(color: kDefaultTextColor, fontSize: 20),
                    headline6:
                        TextStyle(color: kDefaultTextColor, fontSize: 18),
                    button: TextStyle(color: kDefaultTextColor, fontSize: 16),
                    bodyText1:
                        TextStyle(color: kDefaultTextColor, fontSize: 16),
                    bodyText2:
                        TextStyle(color: kDefaultTextColor, fontSize: 12)),
                visualDensity: VisualDensity.adaptivePlatformDensity,
                cardTheme: CardTheme(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(kCardBorderRadius))),
              ),
            );
          }

          return LoadingScreen();
        });
  }
}
