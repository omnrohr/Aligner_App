import 'package:aligner_app/screens/home/components/home_body.dart';
import 'package:aligner_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/decoration_widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          containerShadow(context),
        ]),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.centerLeft,
        //     end: Alignment.centerRight,
        //     colors: [kRightBGM, kLeftBGM, kLeftBGM, kLeftBGM],
        //   ),
        // ),
        child: HomeBody());
  }
}
