import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

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
