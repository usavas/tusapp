import 'package:flutter/material.dart';
import 'package:tusapp/crosscutting/consts.dart';

class WideButton extends StatelessWidget {
  const WideButton(
      {Key key, this.buttonText, this.onPressedFunction, this.backgroundColor})
      : super(key: key);

  final String buttonText;
  final Function onPressedFunction;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    Color backColor = backgroundColor ?? kWidgetBgColor;
    return Container(
      child: SizedBox(
        width: double.infinity,
        // child: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 32),
        child: RaisedButton(
          color: backColor,
          padding: EdgeInsets.all(16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          onPressed: onPressedFunction,
          child: Text(buttonText),
        ),
      ),
      // ),
    );
  }
}
