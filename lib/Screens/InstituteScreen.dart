import 'dart:ffi';
import 'dart:ui';

import 'package:educational_institute/Screens/MainScreen.dart';
import 'package:educational_institute/Screens/Subscreens/add_employee.dart';
import 'package:educational_institute/Screens/Subscreens/add_post.dart';
import 'package:educational_institute/Screens/Subscreens/my_profile.dart';
import 'package:educational_institute/Screens/Subscreens/schedule_seminar.dart';
import 'package:educational_institute/Services/AuthentificationSerivce.dart';
import 'package:educational_institute/Services/navigating_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'Subscreens/student_info.dart';

class InstituteScreen extends StatefulWidget {
  @override
  _InstituteScreenState createState() => _InstituteScreenState();
}

class _InstituteScreenState extends State<InstituteScreen> {
  BoxDecoration _menuDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.transparent, Colors.white]));
  }

  BoxConstraints _menuConstraints(Size size) {
    return BoxConstraints(
      minWidth: size.width,
      maxWidth: size.width,
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
                  top: size.height * 0.2,
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
                  top: size.height * 0.3,
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: size.height * 0.3,
                      minWidth: size.width,
                      maxWidth: size.width,
                      maxHeight: double.infinity,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: _menuDecoration(),
                            constraints: _menuConstraints(size),
                            padding: EdgeInsets.only(left: size.width * 0.1),
                            alignment: Alignment.centerLeft,
                            child: FlatButton(
                              child: Text(
                                'Add Employee',
                                style: TextStyle(
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.05,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => AddEmployee()));
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          Container(
                            decoration: _menuDecoration(),
                            constraints: _menuConstraints(size),
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => AddPost()));
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          Container(
                            decoration: _menuDecoration(),
                            constraints: _menuConstraints(size),
                            padding: EdgeInsets.only(left: size.width * 0.1),
                            alignment: Alignment.centerLeft,
                            child: FlatButton(
                              child: Text(
                                'Manage Employee',
                                style: TextStyle(
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.05,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          Container(
                            decoration: _menuDecoration(),
                            constraints: _menuConstraints(size),
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
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          Container(
                            decoration: _menuDecoration(),
                            constraints: _menuConstraints(size),
                            padding: EdgeInsets.only(left: size.width * 0.1),
                            alignment: Alignment.centerLeft,
                            child: FlatButton(
                              child: Text(
                                'My Profile',
                                style: TextStyle(
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.05,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => MyProfile()));
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          Container(
                            decoration: _menuDecoration(),
                            constraints: _menuConstraints(size),
                            padding: EdgeInsets.only(left: size.width * 0.1),
                            alignment: Alignment.centerLeft,
                            child: FlatButton(
                              child: Text(
                                'Schedule Seminar',
                                style: TextStyle(
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.05,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => ScheduleSeminar()));
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          Container(
                            decoration: _menuDecoration(),
                            constraints: _menuConstraints(size),
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
                          SizedBox(
                            height: size.height * 0.005,
                          ),
                          Container(
                            decoration: _menuDecoration(),
                            constraints: _menuConstraints(size),
                            padding: EdgeInsets.only(left: size.width * 0.1),
                            alignment: Alignment.centerLeft,
                            child: FlatButton(
                              child: Text(
                                'Students Information',
                                style: TextStyle(
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.05,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => StudentInfo()));
                              },
                            ),
                          ),
                        ],
                      ),
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
