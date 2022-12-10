import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backgroundwidget.dart';
import 'package:pruebaflutter1/widgets/identidadcorporativa/identidadsplashwidget.dart';

class IdentidadScreen extends StatelessWidget {
  const IdentidadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          BackgroundWidget(),
          IdentidadSplashWidget(),

        ],
      ),
      // bottomNavigationBar: const BottonNavigation(),
    );
  }
}
