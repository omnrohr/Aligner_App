import 'package:flutter/material.dart';

const kLightPrimaryColor = Colors.black54;
const kLightPrimaryActiveColor = Colors.black87;
const kDarkPrimaryColor = Colors.white70;
const kSecondaryColor = Color(0xFFFE9901);
const kLightBackGroundColor = Colors.white;
const kWarningColor = Color(0xFFF3BB1C);
const kBarGreenColor = Colors.green;
const kMeanBarColor = Colors.blueAccent;
const kErrorColor = Color(0xFFF03738);
const kLightBottomNavBar = Colors.white;
const kFloatingLabelStyle = TextStyle(color: Colors.blueAccent);
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

const kDefaultPadding = 20.0;

final OutlineInputBorder focusedOutlineInputFieldBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
  borderRadius: BorderRadius.circular(4),
);

OutlineInputBorder enabledOutlineInputFieldBorder(BuildContext context) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
          color:
              Theme.of(context).textTheme.headline5!.color!.withOpacity(0.2)));
}

final RegExp phoneNumberValidation = RegExp(r"^(?:[+0]9)?[0-9]{10}$");
