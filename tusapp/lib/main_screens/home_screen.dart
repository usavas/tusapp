import 'package:flutter/material.dart';
import 'package:tusapp/crosscutting/consts.dart';
import 'package:tusapp/crosscutting/widgets/spacers.dart';
import 'package:tusapp/main_screens/past_years_exams_screen.dart';
import '../crosscutting/widgets/buttons.dart';
import '../main_screens/home_screen_jumbotron.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: kPageBgDecoration,
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeScreenJumbotron(),
                SectionSpacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kPagePadding + kWidgetPadding),
                  child: Column(
                    children: [
                      Text(
                        'Test Çöz',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Colors.white),
                      ),
                      WiderSpacer(),
                      WideButton(
                        buttonText: 'Geçmiş Yılların Sınavları',
                        onPressedFunction: () {
                          Navigator.pushNamed(
                              context, PastYearsExamsScreen.routeName);
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
                      SectionSpacer(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
