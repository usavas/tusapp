import 'package:flutter/material.dart';
import 'package:tusapp/global_widgets.dart';
import 'package:tusapp/quiz_result_screen.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({Key key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final String question =
      "Aşağıdaki arterlerden hangisi arteria thoracica interna'nın dallarından biri değildir?";
  final String a = 'A) Arteria pericardiacophrenica';
  final String b = 'B) Arteria musculophrenica';
  final String c = 'C) Arteria intercostalis anterior';
  final String d = 'D) Arteria subscapularis';
  final String e = 'E) Arteria epigastrica superior';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              QuizScreenHeaderRow(),
              SemanticSpacer(),
              Question(question),
              Option(a),
              Option(b),
              Option(c),
              Option(d),
              Option(e),
              SimpleSpacer(),
              Row(
                children: [
                  RaisedButton(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.black, width: .6)),
                    child: Text('Bitir'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/quiz_result_screen');
                    },
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.black, width: .6),
                      ),
                      child: Text('Kontrol Et'),
                      onPressed: () {},
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}

class QuizScreenHeaderRow extends StatelessWidget {
  const QuizScreenHeaderRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: .8),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      '36/120',
                      style: Theme.of(context).textTheme.headline6,
                    )),
                SimpleSpacer(),
                Stack(
                  children: [
                    Container(
                      height: 12,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: .8),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Container(
                      width: 40,
                      height: 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: .8),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Image.asset(
                    'assets/star.png',
                    width: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '380',
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ))
        ],
      ),
    );
  }
}

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

class Option extends StatelessWidget {
  const Option(this.option, {Key key}) : super(key: key);

  final String option;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: .6),
                borderRadius: BorderRadius.circular(20)),
            child: Text(option)),
        SizedBox(
          height: 4,
        )
      ],
    );
  }
}
