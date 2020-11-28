import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String uid;

class AuthServices {
  final FirebaseAuth _firebaseAuth;

  AuthServices(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<bool> singIn(String email, String password) async {
    try {
      var cuser = await _firebaseAuth.signInWithEmailAndPassword(
          email: (email), password: password);
      uid = cuser.user.uid;

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

  Future<bool> singUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: (email), password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }
}
