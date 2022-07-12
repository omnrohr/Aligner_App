import 'package:aligner_app/constants.dart';
import 'package:aligner_app/size_config.dart';

import 'package:flutter/material.dart';

import '../../widgets/decoration_widgets.dart';
import 'components/log_in_body.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);
  static const String routeName = '/logIn';

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
              child: LogInBody(),
            ),
          ),
        ),
      ),
    );
  }
}
