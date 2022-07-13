import 'package:flutter/material.dart';

import './constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    cardColor: kRightBGM,
    primaryColor: kLightPrimaryColor,
    scaffoldBackgroundColor: kLightBackGroundColor,

    appBarTheme: appBarTheme.copyWith(
        iconTheme: const IconThemeData(color: kLightPrimaryActiveColor),
        backgroundColor: kLightBackGroundColor,
        titleTextStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: kLightPrimaryActiveColor,
        )),
    iconTheme: const IconThemeData(color: kLightPrimaryActiveColor),
    // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
    //     .apply(bodyColor: kLightPrimaryColor),
    textTheme: const TextTheme(
      subtitle1:
          TextStyle(color: kLightPrimaryActiveColor, fontFamily: 'Poppins'),
      headline5: TextStyle(
          color: kLightPrimaryActiveColor,
          fontSize: 30,
          fontWeight: FontWeight.bold),
      bodyText1: TextStyle(
        color: kLightPrimaryActiveColor,
        fontFamily: 'Poppins',
        fontSize: 20,
      ),
      bodyText2: TextStyle(color: kLightPrimaryActiveColor),
    ).apply(
        bodyColor: kLightPrimaryActiveColor,
        displayColor: kLightPrimaryActiveColor),
    colorScheme: const ColorScheme.light(
      primary: kLightPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kLightBottomNavBar,
      selectedItemColor: Colors.black87,
      unselectedItemColor: kLightPrimaryColor,
      selectedIconTheme: IconThemeData(color: Colors.black87),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  // By default flutter provide us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    backgroundColor: kDarkPrimaryColor,
    primaryColor: kDarkPrimaryColor,
    scaffoldBackgroundColor: kLightPrimaryColor,

    appBarTheme: appBarTheme.copyWith(backgroundColor: kLightPrimaryColor),
    iconTheme: const IconThemeData(color: kDarkPrimaryColor),
    cardColor: kSplashBGC3,
    // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
    //     .apply(bodyColor: kDarkPrimaryColor),
    textTheme: const TextTheme(
      subtitle1: TextStyle(color: kDarkPrimaryColor, fontFamily: 'Poppins'),
      headline5: TextStyle(
          color: kDarkPrimaryColor, fontSize: 34, fontFamily: 'Poppins'),
      bodyText1: TextStyle(
        fontFamily: 'Poppins',
        color: kDarkPrimaryColor,
        fontSize: 20,
      ),
      bodyText2: TextStyle(color: kDarkPrimaryColor, fontFamily: 'Poppins'),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kDarkPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kLightPrimaryColor,
      selectedItemColor: kDarkPrimaryColor,
      unselectedItemColor: kDarkPrimaryColor.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kDarkPrimaryColor),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
  );
}

const appBarTheme = AppBarTheme(elevation: 0);
