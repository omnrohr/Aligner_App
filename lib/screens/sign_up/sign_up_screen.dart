import 'package:flutter/material.dart';

import 'components/sign_up_body.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  static const String routeName = '/signUp';

  @override
  Widget build(BuildContext context) {
    return SignUpBody();
  }
}
