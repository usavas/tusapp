import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tusapp/crosscutting/consts.dart';
import 'package:tusapp/crosscutting/widgets/spacers.dart';

import 'mockData.dart';
import 'question_screen.dart';
import 'selected_option_provider.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({Key key}) : super(key: key);
  static const String routeName = '/quiz_screen';

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final int lastQuestionIndex = mockQuestions.length - 1;
  final int numberOfQuestions = mockQuestions.length;
  int currentQuestionIndex = 0;
  bool isLastQuestion = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(kPagePadding),
          child: SafeArea(
            child: ChangeNotifierProvider(
              create: (context) => SelectedOptionProvider(),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  QuizScreenHeaderRow(),
                  QuestionScreen(mockQuestions[currentQuestionIndex]),
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
                                side:
                                    BorderSide(color: Colors.black, width: .6),
                              ),
                              child: provider.isAnswerChecked
                                  ? Text('Sonraki soru')
                                  : Text('Kontrol Et'),
                              onPressed: provider.isAnswerChecked
                                  ? () {
                                      if (isLastQuestion) {
                                        Navigator.pushNamed(
                                            context, '/quiz_result_screen',
                                            arguments: ResultArguments(
                                                provider.countCorrectAnswers,
                                                numberOfQuestions));
                                        return;
                                      }
                                      setState(() {
                                        if (currentQuestionIndex <
                                            lastQuestionIndex) {
                                          currentQuestionIndex++;
                                          provider.resetOptionState();
                                        } else if (currentQuestionIndex ==
                                            lastQuestionIndex) {
                                          isLastQuestion = true;
                                          provider.resetOptionState();
                                        }
                                      });
                                    }
                                  : () {
                                      currentQuestionIndex++;
                                      provider.checkAnswer();
                                    }),
                        ),
                      )
                    ],
                  )
                ],
              )),
            ),
          ),
        ),
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

class ResultArguments {
  final int succesfulQuestions;
  final int totalQuestions;

  const ResultArguments(this.succesfulQuestions, this.totalQuestions);
}
