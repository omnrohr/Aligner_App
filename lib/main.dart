import 'package:aligner_app/routes.dart';
import 'package:aligner_app/screens/splashScreen/splash_screen.dart';
import 'package:aligner_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: routes,
      initialRoute: SplashScreen.routeName,
    );
  }
}
