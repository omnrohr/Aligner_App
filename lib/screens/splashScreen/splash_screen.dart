import 'package:flutter/material.dart';

import 'components/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/splashScreen';

  @override
  Widget build(BuildContext context) {
    return SplashScreenBody();
  }
}
