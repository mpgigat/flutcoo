import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backgroundwidget.dart';
import 'package:pruebaflutter1/widgets/identidadcorporativa/mision/mvsplashwidget.dart';


class MVScreen extends StatelessWidget {
  const MVScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [BackgroundWidget(), MVSplashWidget()],
      ),
      // bottomNavigationBar: const BottonNavigation(),
    );
  }
}
