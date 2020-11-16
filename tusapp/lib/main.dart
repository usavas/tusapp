import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tusapp/authentication_screens/signin_with_email_screen.dart';
import 'package:tusapp/authentication_screens/signup_with_email_screen.dart';
import 'package:tusapp/authentication_screens/verify_email_wait_screen.dart';
import 'package:tusapp/authentication_screens/choose_signup_options_screen.dart';
import 'package:tusapp/crosscutting/theme_data.dart';
import 'package:tusapp/main_screens/home_screen.dart';
import 'package:tusapp/main_screens/past_years_exams_screen.dart';
import 'package:tusapp/quiz_screens/quiz_result_screen.dart';
import 'package:tusapp/quiz_screens/quiz_screen.dart';

import 'authentication_screens/create_user_screen.dart';
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
              initialRoute: SigninWithEmailAndPasswordScreen.routeName,
              routes: {
                '/home': (context) => HomeScreen(),
                PastYearsExamsScreen.routeName: (context) =>
                    PastYearsExamsScreen(),
                QuizScreen.routeName: (context) => QuizScreen(),
                QuizResultScreen.routeName: (context) => QuizResultScreen(),
                CreateUserScreen.routeName: (context) => CreateUserScreen(),
                ChooseSignupOptionScreen.routeName: (context) =>
                    ChooseSignupOptionScreen(),
                SignupWithEmailAndPasswordScreen.routeName: (context) =>
                    SignupWithEmailAndPasswordScreen(),
                SigninWithEmailAndPasswordScreen.routeName: (context) =>
                    SigninWithEmailAndPasswordScreen(),
                VerifyEmailWaitScreen.routeName: (context) =>
                    VerifyEmailWaitScreen(),
              },
              debugShowCheckedModeBanner: false,
              title: 'Tus App',
              theme: mainThemeData,
            );
          }

          return LoadingScreen();
        });
  }
}
