import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthProvider {
  static Future initialUser = Firebase.initializeApp();
  static User? currentUser = FirebaseAuth.instance.currentUser;

  static Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: (e.code == 'user-not-found')
              ? 'No user found for that email.'
              : (e.code == 'wrong-password')
                  ? 'Wrong password provided for that user.'
                  : 'an error occurred please try again later');
    }
    return null;
  }

  static Future<UserCredential?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: (e.code == 'weak-password')
              ? 'The password provided is too weak.'
              : (e.code == 'email-already-in-use')
                  ? 'The account already exists for that email.'
                  : 'an error occurred please try again later');
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.toString());
    }
    return null;
  }

  static Future<void> signUserOut() {
    return FirebaseAuth.instance.signOut();
  }
  //todo add model user to add all user data
}
