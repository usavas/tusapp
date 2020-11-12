import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tusapp/crosscutting/consts.dart';
import 'package:tusapp/crosscutting/widgets/spacers.dart';
import 'package:tusapp/question_screens/question_view.dart';
import 'package:tusapp/question_screens/selected_option_provider.dart';

import 'option_view.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({Key key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final String question =
      "Aşağıdaki arterlerden hangisi arteria thoracica interna'nın dallarından biri değildir?";
  final String a = 'A) Arteria pericardiacophrenica';
  final String b = 'B) Arteria musculophrenica';
  final String c = 'C) Arteria intercostalis anterior';
  final String d = 'D) Arteria subscapularis';
  final String e = 'E) Arteria epigastrica superior';
  final answerIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
            child: SingleChildScrollView(
          child: ChangeNotifierProvider(
            create: (context) => SelectedOptionProvider(),
            child: Column(
              children: [
                QuestionScreenHeaderRow(),
                SemanticSpacer(),
                Question(question),
                Option(a, 1),
                Option(b, 2),
                Option(c, 3, isAnswer: true),
                Option(d, 4),
                Option(e, 5),
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
                      child: Consumer<SelectedOptionProvider>(
                        builder: (context, provider, child) => RaisedButton(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.black, width: .6),
                            ),
                            child: provider.isAnswerChecked
                                ? Text('Sonraki soru')
                                : Text('Kontrol Et'),
                            onPressed: provider.isAnswerChecked
                                ? () {
                                    //TODO: Go to the next question
                                    //Refresh the page with new question info
                                  }
                                : () {
                                    provider.checkAnswer();
                                  }),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class QuestionScreenHeaderRow extends StatelessWidget {
  const QuestionScreenHeaderRow({Key key}) : super(key: key);

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
