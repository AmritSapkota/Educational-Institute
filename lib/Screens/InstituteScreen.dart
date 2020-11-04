import 'dart:ffi';
import 'dart:ui';

import 'package:educational_institute/Screens/MainScreen.dart';
import 'package:educational_institute/Screens/Subscreens/upload_post.dart';
import 'package:educational_institute/Services/AuthentificationSerivce.dart';
import 'package:educational_institute/Services/navigating_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InstituteScreen extends StatefulWidget {
  @override
  _InstituteScreenState createState() => _InstituteScreenState();
}

class _InstituteScreenState extends State<InstituteScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.school,
                    color: Colors.blue,
                    size: size.height * 0.4,
                  ),
                ),
                Container(
                  color: Colors.blue.withOpacity(0.4),
                ),
                Positioned(
                  top: size.height * 0.29,
                  left: size.width * 0.09,
                  child: Text(
                    'What you want to do today?',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.06,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.4,
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: size.height * 0.3,
                      minWidth: size.width,
                      maxWidth: size.width,
                      maxHeight: double.infinity,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [Colors.transparent, Colors.white])),
                          constraints: BoxConstraints(
                            minWidth: size.width,
                            maxWidth: size.width,
                          ),
                          padding: EdgeInsets.only(left: size.width * 0.1),
                          alignment: Alignment.centerLeft,
                          child: FlatButton(
                            child: Text(
                              'Add posts',
                              style: TextStyle(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.05,
                              ),
                            ),
                            onPressed: () {
                              Future<dynamic> result = Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: (_) => UploadPost()));
                              if (result != null && result == true) {
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Post Uploaded')));
                              } else {}
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [Colors.transparent, Colors.white])),
                          constraints: BoxConstraints(
                            minWidth: size.width,
                            maxWidth: size.width,
                          ),
                          padding: EdgeInsets.only(left: size.width * 0.1),
                          alignment: Alignment.centerLeft,
                          child: FlatButton(
                            child: Text(
                              'Manage Posts',
                              style: TextStyle(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.05,
                              ),
                            ),
                            onPressed: () {
                              AuthWrapper()
                                  .fromInstitutescreenManagePost(context);
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [Colors.transparent, Colors.white])),
                          constraints: BoxConstraints(
                            minWidth: size.width,
                            maxWidth: size.width,
                          ),
                          padding: EdgeInsets.only(left: size.width * 0.1),
                          alignment: Alignment.centerLeft,
                          child: FlatButton(
                            child: Text(
                              'Profile Settings',
                              style: TextStyle(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.05,
                              ),
                            ),
                            onPressed: () {
                              AuthWrapper()
                                  .fromInstituteScreenProfileSettings(context);
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [Colors.transparent, Colors.white])),
                          constraints: BoxConstraints(
                            minWidth: size.width,
                            maxWidth: size.width,
                          ),
                          padding: EdgeInsets.only(left: size.width * 0.1),
                          alignment: Alignment.centerLeft,
                          child: FlatButton(
                            child: Text(
                              'Sign Out',
                              style: TextStyle(
                                color: Colors.blue[700],
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.05,
                              ),
                            ),
                            onPressed: () {
                              AuthServices(FirebaseAuth.instance).signOut();
                              Navigator.pop(context, null);
                            },
                          ),
                        ),
                      ],
                    ),
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
/*Container(
                  child: Column(
                    children: [

                    ],
                  ),
                ),*/
