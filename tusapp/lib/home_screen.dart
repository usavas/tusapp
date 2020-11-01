import 'package:flutter/material.dart';
import 'package:tusapp/global_widgets.dart';
import 'home_screen_jumbotron.dart';
import 'quiz_screen.dart';

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
                HomeScreenButton(
                  buttonText: 'Geçmiş Yılların Sınavları',
                  onPressedFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(),
                        ));
                  },
                ),
                SimpleSpacer(),
                HomeScreenButton(
                  buttonText: 'Konularına Göre Testler',
                  onPressedFunction: () {},
                ),
                SimpleSpacer(),
                HomeScreenButton(
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
                HomeScreenButton(
                  buttonText: 'Konuları Göster',
                  onPressedFunction: () {},
                ),
                SimpleSpacer(),
                HomeScreenButton(
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

class HomeScreenButton extends StatelessWidget {
  const HomeScreenButton({Key key, this.buttonText, this.onPressedFunction})
      : super(key: key);

  final String buttonText;
  final Function onPressedFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: RaisedButton(
            padding: EdgeInsets.all(20),
            child: Text(buttonText),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            onPressed: onPressedFunction,
          ),
        ),
      ),
    );
  }
}
