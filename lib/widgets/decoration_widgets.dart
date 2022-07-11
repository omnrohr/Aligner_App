import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

BoxShadow containerShadow(BuildContext context) {
  return BoxShadow(
      offset: Offset(-MediaQuery.of(context).size.width, 0),
      color: kRightBGM,
      blurRadius: SizeConfig.screenWidth * 0.4,
      spreadRadius: 100);
}
