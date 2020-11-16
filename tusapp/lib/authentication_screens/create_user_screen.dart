import 'package:flutter/material.dart';

class CreateUserScreen extends StatefulWidget {
  CreateUserScreen({Key key}) : super(key: key);

  static final routeName = '/auth/create_user_screen';

  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: Center(
        child: Text('Create User Screen'),
      )),
    );
  }
}
