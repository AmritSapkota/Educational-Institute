import 'package:educational_institute/Services/database_service.dart';
import 'package:educational_institute/Services/shared_pref.dart';
import 'package:educational_institute/models/employee_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String uid;

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await SharedPrefService().setToSharedPref(key: 'userId', value: null);
    await SharedPrefService().setToSharedPref(key: 'userType', value: null);
    await _firebaseAuth.signOut();
  }

  Future<void> changeCurrentUsersPassword(String password) async {
    //Create an instance of the current user.
    User user = await FirebaseAuth.instance.currentUser;

    //Pass in the password to updatePassword.
    user.updatePassword(password).then((_) {
      print("Your password changed Succesfully ");
    }).catchError((err) {
      print("You can't change the Password" + err.toString());
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  }

  Future<bool> signInAsAdimAfterUserCreation() async {
    return await singIn('admin@gmail.com', 'admin123');
  }

  Future<void> deleteEmployee(EmployeeModel employee) {
    ;
  }

  Future<void> signInAnomously() async {
    //its only for student screen
    String uId;
    _firebaseAuth.signInAnonymously().then((value) {
      uId = value.user.uid;
    });
    await SharedPrefService().setToSharedPref(key: 'userId', value: uId);
    await SharedPrefService()
        .setToSharedPref(key: 'userType', value: 'student');
  }

  Future<bool> singIn(String email, String password) async {
    try {
      //varify user
      var cUser = await _firebaseAuth.signInWithEmailAndPassword(
          email: (email), password: password);
      uid = cUser.user.uid;

      //add to shared pref

      await SharedPrefService().setToSharedPref(key: 'userId', value: uid);
      if (email == 'admin@gmail.com') {
        print(
            '---------------------------setting pref = userType : null ----------------------');
        await SharedPrefService().setToSharedPref(key: 'userType', value: null);
      } else {
        print(
            '---------------------------setting pref = userType : employee ----------------------');
        await SharedPrefService()
            .setToSharedPref(key: 'userType', value: 'employee');
      }

      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<void> resetPassword(String email, context) async {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          Text('Please wait a moment...'),
        ],
      ),
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    Navigator.pop(context);
  }

  Future<String> singUp({String email, String password}) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: (email), password: password);

      uid = user.user.uid;
      await SharedPrefService().setToSharedPref(key: 'userId', value: uid);

      await SharedPrefService()
          .setToSharedPref(key: 'userType', value: 'employee');
      return user.user.uid;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }
}
