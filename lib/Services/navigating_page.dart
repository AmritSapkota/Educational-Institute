import 'package:educational_institute/Screens/InstituteLoginScreen.dart';
import 'package:educational_institute/Screens/InstituteScreen.dart';
import 'package:educational_institute/Screens/MainScreen.dart';
import 'package:educational_institute/Screens/StudentScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AuthentificationSerivce.dart';

class AuthProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthServices>(
          create: (_) => AuthServices(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read()<AuthServices>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        home: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  void fromMainScreen(String buttonType, BuildContext context) {
    if (buttonType == 'institute') {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new InstituteLogIn()));
    } else {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new StudentScreen()));
    }
  }

  Future<Widget> fromInstituteLogInScreen(
      BuildContext context, String mail, String pass) async {
    // ignore: unrelated_type_equality_checks
    if (await AuthServices(FirebaseAuth.instance).singIn(mail, pass) == true) {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new InstituteScreen()));
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) return StudentScreen();
    return MainScreen();
  }
}
