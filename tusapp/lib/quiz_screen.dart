import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tusapp/consts.dart';
import 'package:tusapp/global_widgets.dart';
import 'package:tusapp/selected_option_provider.dart';

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
                QuizScreenHeaderRow(),
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

class Option extends StatefulWidget {
  const Option(this.option, this.optionIndex, {Key key, this.isAnswer = false})
      : super(key: key);

  final String option;
  final int optionIndex;
  final bool isAnswer;

  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    TextStyle _defaultTextStyle = Theme.of(context).textTheme.bodyText2;
    TextStyle _textStyle = Theme.of(context).textTheme.bodyText2;
    Color _cardColor = Theme.of(context).cardTheme.color;

    SelectedOptionProvider provider =
        Provider.of<SelectedOptionProvider>(context);
    final bool isSelected = widget.optionIndex == provider.selectedIndex;

    if (provider.isAnswerChecked) {
      if (widget.isAnswer) {
        _cardColor = Colors.green;
        _textStyle = _defaultTextStyle.copyWith(color: Colors.white);
      } else if (isSelected && !widget.isAnswer) {
        _cardColor = Colors.red;
        _textStyle = _defaultTextStyle.copyWith(color: Colors.white);
      }
    } else {
      if (isSelected) {
        _textStyle = _defaultTextStyle.copyWith(color: Colors.white);
        _cardColor = Colors.blue;
      } else {
        _cardColor = Theme.of(context).cardTheme.color;
        _textStyle = _defaultTextStyle;
      }
    }

    return Card(
      color: _cardColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(kCardBorderRadius),
        onTap: provider.isAnswerChecked
            ? null
            : () {
                provider.changeSelectedIndex(widget.optionIndex);
              },
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Text(widget.option, style: _textStyle),
        ),
      ),
    );
  }
}
