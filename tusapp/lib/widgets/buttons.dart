import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {
  const WideButton({Key key, this.buttonText, this.onPressedFunction})
      : super(key: key);

  final String buttonText;
  final Function onPressedFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: RaisedButton(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Text(buttonText),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            onPressed: onPressedFunction,
          ),
        ),
      ),
    );
  }
}
