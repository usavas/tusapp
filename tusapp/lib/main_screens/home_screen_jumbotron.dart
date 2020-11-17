import 'package:flutter/material.dart';
import 'package:tusapp/authentication/auth_service.dart';

class HomeScreenJumbotron extends StatefulWidget {
  HomeScreenJumbotron({Key key}) : super(key: key);

  @override
  _HomeScreenJumbotronState createState() => _HomeScreenJumbotronState();
}

class _HomeScreenJumbotronState extends State<HomeScreenJumbotron> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(72),
              bottomRight: Radius.circular(72)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text('Merhaba,\n' + AuthService.getService.getCurrentUser.email,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Çözülen Sorular',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  '640/1468',
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 0.6)),
                  width: double.infinity,
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green,
                  ),
                  width: 120,
                  height: 24,
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kazanılan Puan',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  '1846',
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
