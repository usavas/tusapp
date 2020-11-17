import 'package:flutter/material.dart';
import 'package:tusapp/crosscutting/consts.dart';
import 'package:tusapp/main_screens/home_screen.dart';
import 'package:tusapp/quiz_screens/quiz_screen.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({Key key}) : super(key: key);
  static const String routeName = QuizScreen.routeName + '/quiz_result_screen';

  @override
  Widget build(BuildContext context) {
    final QuestionResultArguments resultArgs =
        ModalRoute.of(context).settings.arguments;
    return Material(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tebrikler!',
                style: Theme.of(context).textTheme.headline1,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12),
              ),
              Image.asset('assets/clap.png', width: 48),
              Padding(
                padding: EdgeInsets.only(top: 24),
              ),
              Text(
                resultArgs.succesfulQuestions.toString() +
                    '/' +
                    resultArgs.totalQuestions.toString(),
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'doğru yaptınız',
                style: Theme.of(context).textTheme.headline4,
              ),
              Padding(
                padding: EdgeInsets.only(top: 24),
              ),
              Container(
                width: 200,
                child: RaisedButton(
                  color: kActionButtonColor,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('Ana Ekrana Dön'),
                  onPressed: () {
                    Navigator.popUntil(
                        (context), ModalRoute.withName(HomeScreen.routeName));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
