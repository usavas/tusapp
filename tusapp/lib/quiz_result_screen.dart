import 'package:flutter/material.dart';
import 'package:tusapp/home_screen.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                '46/60',
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
                  color: Color(0xFF3FE4F1),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('Devam Et'),
                  onPressed: () {
                    Navigator.popUntil((context), ModalRoute.withName('/'));
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
