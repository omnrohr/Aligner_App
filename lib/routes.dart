import 'package:aligner_app/screens/home/home_screen.dart';
import 'package:aligner_app/screens/splashScreen/splash_screen.dart';
import 'package:aligner_app/screens/tabs/home_tabs_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  Home.routeName: (context) => const Home(),
  HomeTabsScreen.routeName: (context) => HomeTabsScreen(),
};