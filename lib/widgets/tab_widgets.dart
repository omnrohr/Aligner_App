import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class BlackCircleDot extends StatelessWidget {
  const BlackCircleDot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      decoration: BoxDecoration(
          color: Theme.of(context).textTheme.headline5!.color,
          borderRadius: BorderRadius.circular(25)),
    );
  }
}

class ContainerShadow extends StatelessWidget {
  const ContainerShadow({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: Offset(-MediaQuery.of(context).size.width, 0),
              color: kRightBGM,
              blurRadius: SizeConfig.screenWidth * 0.4,
              spreadRadius: 100),
        ]),
        child: child);
  }
}
