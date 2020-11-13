import 'package:flutter/material.dart';
import 'package:tusapp/crosscutting/consts.dart';
import 'package:tusapp/crosscutting/widgets/spacers.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  static final routeName = '/welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kPagePadding),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Merhaba', style: Theme.of(context).textTheme.headline2),
                  SimpleSpacer(),
                  Container(
                    width: 180,
                    child: Text(
                      'TusApp uygulamasına hoşgeldiniz.',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SemanticSpacer(),
                  Container(
                    width: 300,
                    child: Text(
                      'Kaydınızı tamamlayıp hemen çalışmaya başlayın.',
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
