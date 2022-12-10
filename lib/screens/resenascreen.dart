import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backgroundwidget.dart';
import 'package:pruebaflutter1/widgets/resena/resenasplashwidget.dart';


class ResenaScreen extends StatelessWidget {
  const ResenaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          BackgroundWidget(),
          ResenaSplashWidget()
        ],
      ),
      // bottomNavigationBar: const BottonNavigation(),
    );
  }
}
