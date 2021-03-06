import 'package:aligner_app/constants.dart';
import 'package:flutter/material.dart';

InputDecoration globInputDecoration(String? hint, String label) {
  return InputDecoration(
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200)),
      contentPadding: const EdgeInsets.only(
          top: kDefaultPadding / 2, bottom: kDefaultPadding / 4),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200)),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: hint,
      hintStyle:
          const TextStyle(color: Colors.black26, height: 2.2, fontSize: 14),
      label: Text(
        label,
        style: const TextStyle(color: Colors.black, fontSize: 18),
      ));
}

String? validateEmail(String? email) {
  if (email!.trim().isEmpty) {
    return '* Required';
  } else if (!emailValidatorRegExp.hasMatch(email)) {
    return 'The email address is badly formatted.';
  }
  return null;
}

String? validatePassword(String? input) {
  if (input!.isEmpty) {
    return '*Required';
  } else if (input.length < 8) {
    return 'password must be al least 8 characters';
  } else {
    return null;
  }
}

String? validateConfirmedPassword(String? password, String? confirmPassword) {
  if (password != confirmPassword) {
    return 'Password and confirm password not match';
  }
  return null;
}

String? validatePhoneNumber(String? input) {
  if (input!.trim().isEmpty) {
    return '* Required';
  } else if (input.length != 10) {
    return 'should be 10 numbers "07XXXXXXXX".';
  } else if (!input.startsWith('07')) {
    return 'Please provide a mobile number';
  } else if (!phoneNumberValidation.hasMatch(input)) {
    return 'please numbers only';
  }
  return null;
}

String? validateName(String? input) {
  if (input!.isEmpty) {
    return '*Required';
  } else {
    return null;
  }
}
