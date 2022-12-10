import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backgroundwidget.dart';
import 'package:pruebaflutter1/widgets/pesem/colegio/colegiosplashwidget.dart';

class ColegioScreen extends StatelessWidget {
  const ColegioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [BackgroundWidget(), ColegioSplashWidget()],
      ),
      // bottomNavigationBar: const BottonNavigation(),
    );
  }
}
