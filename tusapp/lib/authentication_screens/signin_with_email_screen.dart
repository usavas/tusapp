import 'package:flutter/material.dart';
import 'package:tusapp/authentication/auth_service.dart';
import 'package:tusapp/crosscutting/consts.dart';

class SigninWithEmailAndPasswordScreen extends StatefulWidget {
  SigninWithEmailAndPasswordScreen({Key key}) : super(key: key);

  static const routeName = '/auth/signin_with_email';

  @override
  _SigninWithEmailAndPasswordScreenState createState() =>
      _SigninWithEmailAndPasswordScreenState();
}

class _SigninWithEmailAndPasswordScreenState
    extends State<SigninWithEmailAndPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: kPageBgDecoration,
          child: SafeArea(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: kPagePadding),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign In Screen',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: kLightTextColor))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
