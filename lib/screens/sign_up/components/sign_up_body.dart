import 'package:aligner_app/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: kDefaultPadding,
        ),
        Image.asset('assets/images/logo.png', height: 80, width: 80),
        const SizedBox(
          height: kDefaultPadding * 2,
        ),
        Text('Sign up', style: Theme.of(context).textTheme.headline5),
        const Spacer(
          flex: 2,
        ),
        const SignUpForm(),
        const Spacer(
          flex: 1,
        ),
      ],
    );
    ;
  }
}
