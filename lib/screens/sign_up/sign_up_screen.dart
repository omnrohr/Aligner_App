import 'package:aligner_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/decoration_widgets.dart';
import 'components/sign_up_body.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  static const String routeName = '/signUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: SizeConfig.screenHeight,
          child: containerWithShadowTopToButton(
            const Padding(
              padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding, horizontal: kDefaultPadding * 2),
              child: SignUpBody(),
            ),
          ),
        ),
      ),
    );
  }
}
