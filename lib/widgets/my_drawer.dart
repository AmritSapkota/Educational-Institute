import 'package:educational_institute/Screens/Student/Drawer/about_us.dart';
import 'package:educational_institute/Screens/Student/Drawer/language_course.dart';
import 'package:educational_institute/Screens/Student/Drawer/serach%20university.dart';
import 'package:educational_institute/Screens/Student/Drawer/settings.dart';
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
        ListTile(
          leading: Icon(Icons.arrow_back),
          title: Text(''),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.search),
          title: Text('University Search'),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => SearchUni()));
          },
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text('Language Courses'),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => LanguageCourses()));
          },
        ),
        ListTile(
          leading: Icon(Icons.merge_type),
          title: Text('Seminars'),
          onTap: () {
            // Navigator.push(context,new MaterialPageRoute(builder: (context) => ()));
          },
        ),
        ListTile(
          leading: Icon(Icons.group),
          title: Text('About Us'),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => AboutUs()));
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(''
              'Settings'),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => Setting()));
          },
        ),
      ]),
    );
  }
}
