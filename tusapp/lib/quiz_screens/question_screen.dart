import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tusapp/crosscutting/consts.dart';
import 'package:tusapp/models/option.dart';
import 'package:tusapp/models/question.dart';
import 'selected_option_provider.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen(this.question, {Key key}) : super(key: key);

  final Question question;

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionView(widget.question.questionText),
        ..._createOptions(widget.question.options)
      ],
    );
  }
}

class QuestionView extends StatelessWidget {
  const QuestionView(this.question, {Key key}) : super(key: key);

  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Center(
        child: Text(question, style: Theme.of(context).textTheme.bodyText1),
      ),
    );
  }
}

List<Widget> _createOptions(List<Option> options) {
  return <Widget>[
    ...options.map((o) => OptionView(o.optionText, options.indexOf(o) + 1,
        isAnswer: o.isCorrect)),
  ];
}

class OptionView extends StatefulWidget {
  const OptionView(this.option, this.optionIndex,
      {Key key, this.isAnswer = false})
      : super(key: key);

  final String option;
  final int optionIndex;
  final bool isAnswer;

  @override
  _OptionViewState createState() => _OptionViewState();
}

class _OptionViewState extends State<OptionView> {
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
        if (isSelected) {
          provider.incrementCorrectAnswers();
        }
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
        borderRadius: BorderRadius.circular(kCardBorderRadiusSize),
        onTap: provider.isAnswerChecked
            ? null
            : () {
                provider.changeSelectedOptionIndex(widget.optionIndex);
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
