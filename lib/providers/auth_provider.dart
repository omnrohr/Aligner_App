import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthProvider {
  static Future initialUser = Firebase.initializeApp();
  static User? currentUser = FirebaseAuth.instance.currentUser;
}
