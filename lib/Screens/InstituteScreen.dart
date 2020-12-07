import 'dart:ffi';
import 'dart:ui';
import 'package:educational_institute/Screens/MainScreen.dart';
import 'package:educational_institute/Screens/Subscreens/add_employee.dart';
import 'package:educational_institute/Screens/Subscreens/add_post.dart';
import 'package:educational_institute/Screens/Subscreens/manage_employee.dart';
import 'package:educational_institute/Screens/Subscreens/my_profile.dart';
import 'package:educational_institute/Screens/Subscreens/schedule_seminar.dart';
import 'package:educational_institute/Services/AuthentificationSerivce.dart';
import 'package:educational_institute/Services/navigating_page.dart';
import 'package:educational_institute/Services/shared_pref.dart';
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
  String userType;
  _InstituteScreenState() {
    SharedPrefService().getFromSharedPref(key: 'userType').then((value) {
      setState(() {
        this.userType = value;
      });
    });
  }
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
                          (userType == null)
                              ? Container(
                                  decoration: _menuDecoration(),
                                  constraints: _menuConstraints(size),
                                  padding:
                                      EdgeInsets.only(left: size.width * 0.1),
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
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => AddEmployee()));
                                    },
                                  ),
                                )
                              : Container(),
                          userType == null
                              ? SizedBox(
                                  height: size.height * 0.005,
                                )
                              : Container(),
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
                          userType == null
                              ? Container(
                                  decoration: _menuDecoration(),
                                  constraints: _menuConstraints(size),
                                  padding:
                                      EdgeInsets.only(left: size.width * 0.1),
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
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ManageEmployee();
                                      }));
                                    },
                                  ),
                                )
                              : Container(),
                          userType == null
                              ? SizedBox(
                                  height: size.height * 0.005,
                                )
                              : Container(),
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
                          userType != null
                              ? Container(
                                  decoration: _menuDecoration(),
                                  constraints: _menuConstraints(size),
                                  padding:
                                      EdgeInsets.only(left: size.width * 0.1),
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
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => UserProfile()));
                                    },
                                  ),
                                )
                              : Container(),
                          userType != null
                              ? SizedBox(
                                  height: size.height * 0.005,
                                )
                              : Container(),
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
                                AuthServices().signOut();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MainScreen()),
                                  (Route<dynamic> route) => route is MainScreen,
                                );
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
