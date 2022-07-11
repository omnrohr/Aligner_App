import 'package:aligner_app/screens/home/components/home_body.dart';
import 'package:flutter/material.dart';

import '../../widgets/tab_widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return const ContainerShadow(
      child: HomeBody(),
    );
  }
}
