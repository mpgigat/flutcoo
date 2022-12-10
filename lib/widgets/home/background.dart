// ignore_for_file: prefer_const_constructors
import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  static const boxDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          //colors: [Color(0xff005c3d), Color.fromARGB(203, 13, 104, 74)]
          colors: [
        Color.fromARGB(103, 250, 252, 248),
        Color.fromARGB(129, 56, 214, 24),
        Color.fromARGB(109, 247, 245, 242)
      ]));

  const Background({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecoration,
        ),
        Positioned(top: -200, left: -30, child: _OrangeBox())
      ],
    );
  }
}

class _OrangeBox extends StatelessWidget {
  const _OrangeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(colors: const [
              // Color.fromRGBO(236, 98, 188, 1),
              // Color.fromRGBO(241, 142, 172, 1)
              Color.fromARGB(255, 238, 166, 11),
              Color.fromARGB(216, 209, 81, 26)
            ])),
      ),
    );
  }
}
