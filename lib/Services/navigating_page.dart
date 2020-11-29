import 'package:educational_institute/Screens/InstituteLoginScreen.dart';
import 'package:educational_institute/Screens/InstituteScreen.dart';
import 'package:educational_institute/Screens/MainScreen.dart';
import 'package:educational_institute/Screens/StudentScreen.dart';
import 'package:educational_institute/Screens/Subscreens/manage_post.dart';
import 'package:educational_institute/Screens/Subscreens/my_profile.dart';
import 'package:educational_institute/Screens/Subscreens/add_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  void fromMainScreen(String buttonType, BuildContext context) async {
    if (buttonType == 'institute') {
      //TODO: get student uid and then store it for the rest of the app till uninstall
      //so that post will store uid in like section to show that this user has like the post
      // and on the other hand this uid will help to log in user in student page or institute page
      // when he/she opens app for second time
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new InstituteLogIn()));
    } else {
      //TODO: get student uid and then store it for the rest of the app till uninstall
      //TODO: use shared prefs to store value and then
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new StudentScreen()));
    }
  }

  void fromInstitutescreenManagePost(BuildContext context) {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new ManagePost()));
  }

  // void fromInstituteScreenProfileSettings(BuildContext context) {
  //   Navigator.push(context,
  //       new MaterialPageRoute(builder: (context) => new ChangeProfile()));
  // }

  /*bool fromInstituteScreenAddPost(BuildContext context) {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new UploadPost()));
  }*/

  Future<Widget> fromInstituteLogInScreen(
      BuildContext context, String mail, String pass) async {
    // ignore: unrelated_type_equality_checks
    if (await AuthServices(FirebaseAuth.instance).singIn(mail, pass) == true) {
      Navigator.pop(context);
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new InstituteScreen()));
    } else {
      Navigator.pop(context);
      return await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Login Failed!!'),
          content: Text('Please check your id/password.'),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pop(); // dismisses only the dialog and returns nothing
              },
              child: new Text('Retry'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) return StudentScreen();
    return MainScreen();
  }
}
