import 'package:educational_institute/Screens/MainScreen.dart';
import 'package:educational_institute/Screens/Student/about_us.dart';
import 'package:educational_institute/Screens/Student/booked_class_form.dart';
import 'package:educational_institute/Screens/Student/seminar_page.dart';
import 'package:educational_institute/Screens/Student/settings.dart';
import 'package:educational_institute/Services/AuthentificationSerivce.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Icons.cancel,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.language,
            color: Colors.blue,
          ),
          title: Text(
            'Book Class',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => ApplyNowForLanguageCourse()));
          },
        ),
        ListTile(
          leading: Icon(
            Icons.merge_type,
            color: Colors.blue,
          ),
          title: Text(
            'Seminars',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => SeminarPage()));
          },
        ),
        ListTile(
          leading: Icon(
            Icons.group,
            color: Colors.blue,
          ),
          title: Text(
            'About Us',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => AboutUs()));
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.blue,
          ),
          title: Text(
            ''
            'LogOut',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          onTap: () {
            _logOut();
          },
        ),
      ]),
    );
  }

  void _logOut() {
    //log out user and set preferences
    AuthServices().signOut().then((value) {
      //then place only one page in app i.e. main screen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => MainScreen()),
        (Route<dynamic> route) => route is MainScreen,
      );
    });
  }
}
