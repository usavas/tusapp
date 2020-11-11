import 'package:flutter/material.dart';
import 'package:tusapp/global_widgets.dart';
import 'home_screen_jumbotron.dart';
import 'widgets/buttons.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFF405998), Color(0xFFAA27F5)],
          )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeScreenJumbotron(),
                SemanticSpacer(),
                Text(
                  'Test Çöz',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white),
                ),
                HeaderSpacer(),
                WideButton(
                  buttonText: 'Geçmiş Yılların Sınavları',
                  onPressedFunction: () {
                    Navigator.pushNamed(
                        context, '/past_years_questions_screen');
                  },
                ),
                SimpleSpacer(),
                WideButton(
                  buttonText: 'Konularına Göre Testler',
                  onPressedFunction: () {},
                ),
                SimpleSpacer(),
                WideButton(
                  buttonText: 'Karma Test',
                  onPressedFunction: () {},
                ),
                SemanticSpacer(),
                Text(
                  'Konu Çalış',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                WideButton(
                  buttonText: 'Konuları Göster',
                  onPressedFunction: () {},
                ),
                SimpleSpacer(),
                WideButton(
                  buttonText: 'Notlarımı Göster',
                  onPressedFunction: () {},
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
