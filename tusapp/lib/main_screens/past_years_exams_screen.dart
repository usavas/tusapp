import 'package:flutter/material.dart';
import 'package:tusapp/main_screens/home_screen.dart';
import 'package:tusapp/quiz_screens/quiz_screen.dart';

import '../crosscutting/widgets/buttons.dart';

class PastYearsExamsScreen extends StatelessWidget {
  const PastYearsExamsScreen({Key key}) : super(key: key);
  static const String routeName =
      HomeScreen.routeName + '/past_years_exams_screen';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
            child: Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFF405998), Color(0xFFAA27F5)],
          )),
          child: Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PastYearQuestions(i),
                        );
                      }),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class PastYearQuestions extends StatelessWidget {
  const PastYearQuestions(this.index, {Key key}) : super(key: key);
  final index;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: WideButton(
      buttonText: (2020 - index).toString() + ' Yılı Soruları',
      onPressedFunction: () {
        Navigator.pushNamed(context, QuizScreen.routeName);
      },
    ));
  }
}
