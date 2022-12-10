import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backgroundwidget.dart';
import 'package:pruebaflutter1/widgets/pesem/instituto/institutosplashwidget.dart';

class InstitutoScreen extends StatelessWidget {
  const InstitutoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [BackgroundWidget(), InstitutoSplashWidget()],
      ),
      // bottomNavigationBar: const BottonNavigation(),
    );
  }
}
