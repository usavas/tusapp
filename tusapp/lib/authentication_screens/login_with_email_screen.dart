import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tusapp/crosscutting/consts.dart';
import 'package:tusapp/crosscutting/widgets/buttons.dart';
import 'package:tusapp/crosscutting/widgets/spacers.dart';
import 'package:tusapp/authentication/auth_service.dart';

class LoginWithEmailAndPasswordScreen extends StatefulWidget {
  LoginWithEmailAndPasswordScreen({Key key}) : super(key: key);

  static const routeName = '/login/login_with_email';
  @override
  _LoginWithEmailAndPasswordScreenState createState() =>
      _LoginWithEmailAndPasswordScreenState();
}

class _LoginWithEmailAndPasswordScreenState
    extends State<LoginWithEmailAndPasswordScreen> {
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
                          ),
                          SimpleSpacer(),
                          TextInput('Şifrenizi tekrar girin.',
                              _passwdRepeatController, (value) {
                            if (_passwdController.text != value) {
                              return 'Girdiğiniz şifreler birbiriyle aynı olmalıdır.';
                            }
                            return null;
                          }),
                          WiderSpacer(),
                          WideButton(
                              buttonText: 'Kaydol',
                              onPressedFunction: () {
                                if (_formKey.currentState.validate()) {
                                  _createUserWithEmailAndPasswd(
                                      _emailController.text,
                                      _passwdController.text);
                                }
                              }),
                        ],
                      ))
                ],
              ),
            ),
          )),
    );
  }

  bool _validateEmail(String email) {
    return true;
  }

  bool _validatePasswd(String passwd) {
    return true;
  }

  _createUserWithEmailAndPasswd(String email, String passwd) async {
    UserCredential credentials;

    try {
      credentials = await AuthService.getInstance
          .createUserWithEmailAndPasswd(email, passwd);

      print(credentials.user.email);
      print(credentials.user.emailVerified);
      print(credentials.user.uid);
    } catch (e) {
      print(e);
    }
  }
}

class TextInput extends StatelessWidget {
  const TextInput(this.hintText, this.controller, this.validator, {Key key})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kWidgetInnerPadding),
        width: double.infinity,
        decoration: kInputFieldBgDecoration,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
          ),
          validator: validator,
        ),
      ),
    );
  }
}
