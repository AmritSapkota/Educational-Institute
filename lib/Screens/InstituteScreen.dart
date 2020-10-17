import 'package:educational_institute/Screens/MainScreen.dart';
import 'package:educational_institute/Services/AuthentificationSerivce.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InstituteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      RaisedButton(
                        child: Text('Sign Out'),
                        onPressed: () {
                          AuthServices(FirebaseAuth.instance).signOut();
                          Navigator.pop(context, null);
                        },
                      ),
                      RaisedButton(
                        child: Text('Manage Post'),
                        onPressed: () {
                          //AuthServices(FirebaseAuth.instance).signOut();
                          //Navigator.pop(context, null);
                        },
                      ),
                      RaisedButton(
                        child: Text('Manage Seminars'),
                        onPressed: () {
                          //AuthServices(FirebaseAuth.instance).signOut();
                          // Navigator.pop(context, null);
                        },
                      ),
                      RaisedButton(
                        child: Text('Profile Settings'),
                        onPressed: () {
                          //AuthServices(FirebaseAuth.instance).signOut();
                          //Navigator.pop(context, null);
                        },
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
/**/
