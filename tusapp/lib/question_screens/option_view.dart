import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tusapp/question_screens/selected_option_provider.dart';

import '../crosscutting/consts.dart';

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
