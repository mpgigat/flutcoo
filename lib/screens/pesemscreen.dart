import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backgroundwidget.dart';
import 'package:pruebaflutter1/widgets/pesem/pesemsplashwidget.dart';

class PesemScreen extends StatelessWidget {
  const PesemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [BackgroundWidget(), PesemSplashWidget()],
      ),
      // bottomNavigationBar: const BottonNavigation(),
    );
  }
}
