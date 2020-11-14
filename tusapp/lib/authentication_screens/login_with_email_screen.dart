import 'package:flutter/material.dart';
import 'package:tusapp/crosscutting/consts.dart';
import 'package:tusapp/crosscutting/widgets/buttons.dart';
import 'package:tusapp/crosscutting/widgets/spacers.dart';

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
    return Container(
      child: Scaffold(
        body: Container(
            decoration: kPageBgDecoration,
            padding: const EdgeInsets.symmetric(horizontal: kPagePadding),
            child: SafeArea(
                child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kWidgetPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                                //todo: check if email is valid
                                if (value.isEmpty) {
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
                                //todo: check if passwd is valid
                                if (value.isEmpty) {
                                  return 'Lütfen geçerli bir şifre girin.';
                                }
                                return null;
                              },
                            ),
                            SimpleSpacer(),
                            TextInput('Şifrenizi tekrar girin.',
                                _passwdRepeatController, (value) {
                              //todo: check if passwords are same
                              if (value.isEmpty) {
                                return 'Girdiğiniz şifreler birbiriyle aynı olmalıdır.';
                              }
                              return null;
                            }),
                            WiderSpacer(),
                            WideButton(
                                buttonText: 'Kaydol',
                                onPressedFunction: () {
                                  if (_formKey.currentState.validate()) {
                                    // createUser
                                  }
                                }),
                          ],
                        ))
                  ],
                ),
              ),
            ))),
      ),
    );
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
