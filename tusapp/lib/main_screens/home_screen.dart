import 'package:flutter/material.dart';
import 'package:tusapp/authentication/auth_service.dart';
import 'package:tusapp/authentication/auth_shared_pref.dart';
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
  // bool _remembersPasswd = false;

  _setRememberPasswordStatus(value) async {
    AuthSharedPref.instance.setRememberPasswdStatus(value);
    AuthSharedPref.instance.remembersPasswd().then((value) =>
        print('auth remember status changed on drawer: ' + value.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      drawer: Drawer(
          child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration:
                  BoxDecoration(shape: BoxShape.rectangle, color: Colors.blue),
              currentAccountPicture: (AuthService
                          .getService.getAuthInstance.currentUser.photoURL !=
                      null)
                  ? Image.network(AuthService
                      .getService.getAuthInstance.currentUser.photoURL)
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        color: Colors.green,
                        child: Icon(
                          Icons.person,
                          size: 64,
                          color: kLightTextColor,
                        ),
                      ),
                    ),
              accountName: Text((AuthService
                      .getService.getAuthInstance.currentUser?.displayName ??
                  'User with no name')),
              accountEmail: Text(
                  (AuthService.getService.getAuthInstance.currentUser?.email ??
                      ''))),
          WiderSpacer(),
          ListTile(
            leading: FutureBuilder(
              future: AuthSharedPref.instance.remembersPasswd(),
              builder: (context, AsyncSnapshot<bool> snapshot) => Switch(
                  value: snapshot.data ?? false,
                  onChanged: (value) async {
                    AuthSharedPref.instance.setRememberPasswdStatus(value);
                    setState(() {});
                  }),
            ),
            title: Text('Şifreyi hatırla'),
          ),
        ],
      )),
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
