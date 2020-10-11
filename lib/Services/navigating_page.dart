import 'package:educational_institute/Screens/InstituteLoginScreen.dart';
import 'package:educational_institute/Screens/InstituteScreen.dart';
import 'package:educational_institute/Screens/StudentScreen.dart';
import 'package:flutter/material.dart';
import 'AuthentificationSerivce.dart';

class NavigatingScreen {
  void fromMainScreen(String buttonType, BuildContext context) {
    if (buttonType == 'institute') {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new InstituteLogIn()));
    } else {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new StudentScreen()));
    }
  }

  Future<void> fromInstituteLogInScreen(
      BuildContext context, String mail, String pass) async {
    // ignore: unrelated_type_equality_checks
    if (await AuthServices().singIn(mail, pass) == true) {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new InstituteScreen()));
    } else
      return;
  }
}
