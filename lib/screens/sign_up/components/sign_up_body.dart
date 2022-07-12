import 'package:aligner_app/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Image.asset('assets/images/logo.png', height: 80, width: 80),
                const SizedBox(
                  height: kDefaultPadding * 2,
                ),
                Text('Sign up', style: Theme.of(context).textTheme.headline5),
                const SignUpForm(),
              ],
            ),
          ),
        );
      },
    );
  }
}
