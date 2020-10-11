import 'package:educational_institute/Screens/MainScreen.dart';
import 'package:educational_institute/Services/AuthentificationSerivce.dart';
import 'package:flutter/material.dart';

class InstituteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RaisedButton(
            child: Text('Sign Out'),
            onPressed: () {
              Navigator.pop(context, null);
            },
          ),
        ),
      ),
    );
  }
}
