import 'package:aligner_app/screens/log_in/components/log_in_form.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../sign_up/sign_up_screen.dart';

class LogInBody extends StatelessWidget {
  const LogInBody({
    Key? key,
  }) : super(key: key);

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
        Text('Login', style: Theme.of(context).textTheme.headline5),
        const Spacer(
          flex: 2,
        ),
        const LogInForm(),
        const Spacer(
          flex: 1,
        ),
        const Text("Don't fave an account?"),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SignUp.routeName);
            },
            child: const Text('Sign Up')),
      ],
    );
  }
}
