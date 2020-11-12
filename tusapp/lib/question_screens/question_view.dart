import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question(this.question, {Key key}) : super(key: key);

  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          // height: 200,
          child: Center(
            child: Text(question, style: Theme.of(context).textTheme.bodyText1),
          )),
    );
  }
}
