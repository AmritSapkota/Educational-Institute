import 'package:educational_institute/Screens/InstituteScreen.dart';
import 'package:educational_institute/Screens/MainScreen.dart';
import 'package:educational_institute/Screens/Student/seminar_page.dart';
import 'package:educational_institute/Screens/Subscreens/add_employee.dart';
import 'package:educational_institute/Screens/Subscreens/manage_employee.dart';
import 'package:educational_institute/Services/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/StudentScreen.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String userType;
  _AppState() {
    SharedPrefService().getFromSharedPref(key: 'userType').then((value) {
      setState(() {
        userType = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(
            child: Center(child: Text('No Network Connection!')),
          );
        }

        // if firebase installed and has network connection then we proceed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return userType == 'student'
              ? StudentScreen()
              : userType == null
                  ? MainScreen()
                  : InstituteScreen();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
