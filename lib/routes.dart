import 'package:aligner_app/screens/home/home_screen.dart';
import 'package:aligner_app/screens/log_in/log_in_screen.dart';
import 'package:aligner_app/screens/messenger/messenger_screen.dart';
import 'package:aligner_app/screens/sign_up/sign_up_screen.dart';
import 'package:aligner_app/screens/splashScreen/splash_screen.dart';
import 'package:aligner_app/screens/tabs/home_tabs_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  Home.routeName: (context) => const Home(),
  HomeTabsScreen.routeName: (context) => const HomeTabsScreen(),
  SignUp.routeName: (context) => const SignUp(),
  LogInScreen.routeName: (context) => const LogInScreen(),
  MessengerScreen.routeName: (context) => const MessengerScreen(),
};
