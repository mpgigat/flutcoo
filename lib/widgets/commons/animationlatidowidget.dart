import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class LatidoWiget extends StatefulWidget {
  const LatidoWiget({super.key, required this.title});
  final String title;

  @override
  _LatidoWigetState createState() => new _LatidoWigetState();
}

class _LatidoWigetState extends State<LatidoWiget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // #docregion addListener
    animation = Tween<double>(begin: 12, end: 24).animate(controller)
      ..addListener(() {
        // #enddocregion addListener
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
        // #docregion addListener
      });
    // #enddocregion addListener
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
