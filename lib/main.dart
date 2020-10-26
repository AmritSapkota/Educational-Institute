import 'package:educational_institute/Screens/InstituteLoginScreen.dart';
import 'package:educational_institute/Screens/InstituteScreen.dart';
import 'package:educational_institute/Screens/MainScreen.dart';
import 'package:educational_institute/Screens/Student/Drawer/about_us.dart';
import 'package:educational_institute/Screens/Student/Drawer/serach%20university.dart';
import 'package:educational_institute/Screens/Student/Drawer/settings.dart';
import 'package:educational_institute/Screens/StudentScreen.dart';
import 'package:educational_institute/Screens/Subscreens/manage_post.dart';
import 'package:educational_institute/Screens/Subscreens/profile_settings.dart';
import 'package:educational_institute/Screens/Subscreens/upload_post.dart';
import 'package:educational_institute/Services/navigating_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: InstituteLogIn());
  }
}
