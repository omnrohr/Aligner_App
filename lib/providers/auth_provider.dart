import 'dart:ffi';

import 'package:aligner_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthProvider {
  static late AlignerUser alignerUser;

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
      {required String email,
      required String password,
      required String fName,
      required String lName,
      required String phoneNumber,
      required String nickName,
      required DateTime birthDate}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      alignerUser = AlignerUser(
          id: credential.user!.uid,
          fName: fName,
          lName: lName,
          birthDate: birthDate,
          nickName: nickName,
          phoneNumber: phoneNumber);
      await addUserDataToDataBase(alignerUser);
      return credential;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: (e.code == 'weak-password')
              ? 'The password provided is too weak.'
              : (e.code == 'email-already-in-use')
                  ? 'The account already exists for that email.'
                  : 'an error occurred please try again later');
    } on PlatformException catch (err) {
      String? message = 'An error occurred, please check your credentials!';
      if (err.message != null) {
        message = err.message;
      }
      Fluttertoast.showToast(msg: message!);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    return null;
  }

  static Future<void> signUserOut() {
    return FirebaseAuth.instance.signOut();
  }
  //todo add model user to add all user data

  static addUserDataToDataBase(AlignerUser user) {
    return FirebaseFirestore.instance.collection('users').doc(user.id).set({
      'fName': user.fName,
      'lName': user.fName,
      'imageUrl': user.imageUrl,
      'phoneNumber': user.phoneNumber,
      'birthDate': user.birthDate.toIso8601String(),
      'nickName': user.nickName
    });
  }
}
