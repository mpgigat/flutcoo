import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backgroundwidget.dart';
import 'package:pruebaflutter1/widgets/quienessomos/qssplashwidget.dart';

class QuienesSomosScreen extends StatelessWidget {
  const QuienesSomosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [BackgroundWidget(), QuienesSomosSplashWidget()],
      ),
      // bottomNavigationBar: const BottonNavigation(),
    );
  }
}
