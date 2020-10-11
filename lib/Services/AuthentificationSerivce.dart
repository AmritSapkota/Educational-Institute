import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<bool> singIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: (email), password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  Future<bool> singUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: (email), password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }
}
