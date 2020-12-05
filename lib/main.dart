import 'package:educational_institute/Screens/MainScreen.dart';
import 'package:educational_institute/Screens/Subscreens/student_info.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

class App extends StatelessWidget {
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
          return MainScreen();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
