import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tusapp/authentication/auth_service.dart';
import 'package:tusapp/authentication/auth_shared_pref.dart';
import 'package:tusapp/authentication_screens/signup_with_email_screen.dart';
import 'package:tusapp/crosscutting/consts.dart';
import 'package:tusapp/crosscutting/widgets/buttons.dart';
import 'package:tusapp/crosscutting/widgets/spacers.dart';
import 'package:tusapp/crosscutting/widgets/text_input.dart';
import 'package:tusapp/main_screens/home_screen.dart';

class SigninWithEmailAndPasswordScreen extends StatefulWidget {
  SigninWithEmailAndPasswordScreen({Key key}) : super(key: key);

  static const routeName = '/auth/signin_with_email';

  @override
  _SigninWithEmailAndPasswordScreenState createState() =>
      _SigninWithEmailAndPasswordScreenState();
}

class _SigninWithEmailAndPasswordScreenState
    extends State<SigninWithEmailAndPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwdController = TextEditingController();

  bool _rememberPasswd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: kPageBgDecoration,
          child: SafeArea(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: kPagePadding + kWidgetPadding),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('E-posta ile giris yap',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: kLightTextColor)),
                    WiderSpacer(),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextInput('E-posta adresiniz', _emailController,
                              (value) {
                            if (value == '') {
                              return 'E-posta adresi boş olamaz';
                            }
                          }),
                          SimpleSpacer(),
                          TextInput(
                            'Şifreniz',
                            _passwdController,
                            (value) {
                              if (value.toString().trim() == '') {
                                return 'Şifre boş olamaz';
                              }
                            },
                            isPasswd: true,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: _rememberPasswd,
                                  onChanged: (isChecked) {
                                    setState(() {
                                      _rememberPasswd = isChecked;
                                    });
                                  }),
                              Text('Şifremi hatırla',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(color: kLightTextColor)),
                            ],
                          ),
                          Builder(
                            builder: (context) => WideButton(
                              backgroundColor: kActionButtonColor,
                              buttonText: 'Giriş yap',
                              onPressedFunction: () {
                                if (_formKey.currentState.validate()) {
                                  _login(context, _emailController.text,
                                      _passwdController.text);
                                }
                              },
                            ),
                          ),
                          SimpleSpacer(),
                          FlatButton(
                            child: Text(
                              'Kaydınız yoksa yeni kayıt yapın',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(
                                      color: kLightTextColor,
                                      decoration: TextDecoration.underline),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SignupWithEmailAndPasswordScreen(),
                                  ));
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }

  _login(BuildContext context, String email, String passwd) async {
    try {
      UserCredential userCredential =
          await AuthService.getService.signInWithEmailAndPasswd(email, passwd);
      if (userCredential.user != null) {
        AuthSharedPref.instance.setRememberPasswdStatus(_rememberPasswd);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      }
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(e.toString().replaceAll('Exception: ', '')),
      ));
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwdController.dispose();
    super.dispose();
  }
}
