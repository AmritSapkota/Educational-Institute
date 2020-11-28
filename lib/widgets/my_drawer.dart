import 'package:educational_institute/Screens/Student/Student/about_us.dart';
import 'package:educational_institute/Screens/Student/Student/apply_now_language.dart';
import 'package:educational_institute/Screens/Student/Student/seminar.dart';
import 'package:educational_institute/Screens/Student/Student/settings.dart';
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
            'Settings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => Setting()));
          },
        ),
      ]),
    );
  }
}
