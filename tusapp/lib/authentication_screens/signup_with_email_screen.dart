import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tusapp/authentication_screens/verify_email_wait_screen.dart';
import 'package:tusapp/crosscutting/consts.dart';
import 'package:tusapp/crosscutting/widgets/buttons.dart';
import 'package:tusapp/crosscutting/widgets/spacers.dart';
import 'package:tusapp/authentication/auth_service.dart';
import 'package:tusapp/crosscutting/widgets/text_input.dart';

class SignupWithEmailAndPasswordScreen extends StatefulWidget {
  SignupWithEmailAndPasswordScreen({Key key}) : super(key: key);

  static const routeName = '/auth/signup_with_email';
  @override
  _SignupWithEmailAndPasswordScreenState createState() =>
      _SignupWithEmailAndPasswordScreenState();
}

class _SignupWithEmailAndPasswordScreenState
    extends State<SignupWithEmailAndPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwdController = TextEditingController();
  TextEditingController _passwdRepeatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: kPageBgDecoration,
          padding: const EdgeInsets.symmetric(horizontal: kPagePadding),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kWidgetPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'E-posta adresi ve şifre girin.',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: kLightTextColor),
                  ),
                  SectionSpacer(),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextInput(
                            'E-posta adresinizi girin',
                            _emailController,
                            (value) {
                              if (!_validateEmail(value)) {
                                return 'Lütfen geçerli bir e-posta adresi girin.';
                              }
                              return null;
                            },
                          ),
                          SimpleSpacer(),
                          TextInput(
                            'Şifrenizi girin.',
                            _passwdController,
                            (value) {
                              if (!_validatePasswd(value)) {
                                return 'Lütfen geçerli bir şifre girin.';
                              }
                              return null;
                            },
                            isPasswd: true,
                          ),
                          SimpleSpacer(),
                          TextInput(
                            'Şifrenizi tekrar girin.',
                            _passwdRepeatController,
                            (value) {
                              if (value != '' &&
                                  _passwdController.text != value) {
                                return 'Girdiğiniz şifreler birbiriyle aynı olmalıdır.';
                              }
                              return null;
                            },
                            isPasswd: true,
                          ),
                          WiderSpacer(),
                          Builder(
                            builder: (context) => WideButton(
                                backgroundColor: kActionButtonColor,
                                buttonText: 'Kaydol',
                                onPressedFunction: () {
                                  if (_formKey.currentState.validate()) {
                                    _createUserWithEmailAndPasswd(
                                        _emailController.text,
                                        _passwdController.text,
                                        context);
                                  }
                                }),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          )),
    );
  }

  bool _validateEmail(String email) {
    if (email.trim() == '') {
      return false;
    }
    return true;
  }

  bool _validatePasswd(String passwd) {
    if (passwd.trim() == '') {
      return false;
    }
    return true;
  }

  _createUserWithEmailAndPasswd(
      String email, String passwd, BuildContext context) async {
    try {
      if (AuthService.getService.getAuthInstance.currentUser != null) {
        await AuthService.getService.getAuthInstance.currentUser.reload();
        if (AuthService.getService.getAuthInstance.currentUser.emailVerified) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Zaten kaydınız var. Login ekranına gidiniz.'),
          ));
          // return;
        }
      }
      UserCredential userCredential = await AuthService.getService
          .createUserWithEmailAndPasswd(email, passwd);
      if (userCredential != null) {
        await AuthService.getService.verifyEmail();
        await AuthService.getService.getAuthInstance.currentUser.reload();
      }
    } catch (e) {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(e.toString().replaceAll('Exception: ', ''))));
    }

    Navigator.pushNamed(context, VerifyEmailWaitScreen.routeName);
  }
}
