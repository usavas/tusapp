import 'package:flutter/material.dart';
import 'package:tusapp/crosscutting/consts.dart';
import 'package:tusapp/crosscutting/widgets/buttons.dart';
import 'package:tusapp/crosscutting/widgets/spacers.dart';

import 'signup_with_email_screen.dart';

class ChooseSignupOptionScreen extends StatelessWidget {
  const ChooseSignupOptionScreen({Key key}) : super(key: key);
  static final routeName = '/welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(kPagePadding),
        decoration: kPageBgDecoration,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(kWidgetPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Merhaba',
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(color: kLightTextColor)),
                  SectionSpacer(),
                  Container(
                    width: 180,
                    child: Text(
                      'TusApp uygulamasına hoşgeldiniz.',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: kLightTextColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SectionSpacer(),
                  Container(
                    width: 300,
                    child: Text(
                      'Kaydınızı tamamlayıp hemen çalışmaya başlayın.',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: kLightTextColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SectionSpacer(),
                  WideButton(
                      buttonText: 'E-posta adresi ile kaydol',
                      onPressedFunction: () {
                        Navigator.pushNamed(context,
                            SignupWithEmailAndPasswordScreen.routeName);
                      }),
                  SimpleSpacer(),
                  WideButton(
                      buttonText: 'Google ile kaydol',
                      onPressedFunction: () {}),
                  SimpleSpacer(),
                  WideButton(
                      buttonText: 'Facebook ile kaydol',
                      onPressedFunction: () {}),
                  SimpleSpacer(),
                  WideButton(
                      buttonText: 'Kaydolmadan devam et',
                      onPressedFunction: () {}),
                  SimpleSpacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
