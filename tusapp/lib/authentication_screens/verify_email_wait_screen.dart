import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tusapp/authentication/auth_service.dart';
import 'package:tusapp/authentication_screens/signin_with_email_screen.dart';
import 'package:tusapp/crosscutting/consts.dart';
import 'package:tusapp/crosscutting/widgets/buttons.dart';
import 'package:tusapp/crosscutting/widgets/spacers.dart';

class VerifyEmailWaitScreen extends StatelessWidget {
  const VerifyEmailWaitScreen({Key key}) : super(key: key);

  static const routeName = '/auth/verify_email_wait';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kPageBgDecoration,
        child: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kWidgetPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'E-posta adresinize bir doğrulama linki gönderildi. Onaylayıp giriş yapabilirsiniz.',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: kLightTextColor),
                  textAlign: TextAlign.center,
                ),
                WiderSpacer(),
                WideButton(
                  buttonText: 'E-posta adresimi doğruladım.',
                  onPressedFunction: () {
                    AuthService.getService.getAuthInstance.currentUser.reload();
                    print('email verified? : ' +
                        AuthService.getService.getAuthInstance.currentUser
                            .emailVerified
                            .toString());
                    print(FirebaseAuth.instance.currentUser.emailVerified
                        .toString());
                    print(FirebaseAuth.instance.currentUser.email);
                    if (AuthService
                        .getService.getAuthInstance.currentUser.emailVerified) {
                      Navigator.pushNamed(
                          context, SigninWithEmailAndPasswordScreen.routeName);
                    }
                  },
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
