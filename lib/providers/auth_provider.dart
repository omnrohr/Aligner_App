import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthProvider {
  static Future initialUser = Firebase.initializeApp();
  static User? currentUser = FirebaseAuth.instance.currentUser;

  static Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
  //todo add model user to add all user data
}
