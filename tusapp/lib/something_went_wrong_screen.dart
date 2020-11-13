import 'package:flutter/material.dart';

class SomethingWentWrongScreen extends StatelessWidget {
  const SomethingWentWrongScreen(this.error, {Key key}) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Something went wrong connecting to the database. ' +
                  'You may have trouble using some features in this app. ' +
                  'Check your connection and try again'),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Text(error)
            ],
          ),
        )),
      ),
    );
  }
}
