import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backgroundwidget.dart';
import 'package:pruebaflutter1/widgets/politica/politicasplashwidget.dart';

class PoliticaScreen extends StatelessWidget {
  const PoliticaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [BackgroundWidget(), PoliticaSplashWidget()],
      ),
      // bottomNavigationBar: const BottonNavigation(),
    );
  }
}
