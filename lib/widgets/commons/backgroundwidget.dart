// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  static const boxDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          //colors:Color.fromARGB(255, 214, 229, 155)B(203, 13, 104, 74)]
          colors: [
        Color.fromARGB(255, 239, 247, 203),
        Color.fromARGB(205, 248, 249, 246)
      ]));

  const BackgroundWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecoration,
        ),
        // Positioned(top: -100, left: -30, child: _OrangeBox())
      ],
    );
  }
}
