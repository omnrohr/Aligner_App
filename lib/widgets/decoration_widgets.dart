import 'package:flutter/material.dart';

Container containerWithShadowTopToButton(Widget child) {
  return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.white,
                Colors.purple.shade50,
                Colors.white,
                Colors.purple.shade50,
                Colors.white,
              ],
              end: Alignment.bottomRight)),
      child: child);
}
