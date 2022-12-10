import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backgroundwidget.dart';
import 'package:pruebaflutter1/widgets/identidadcorporativa/estructuraorganizacional/estructurasplashwidget.dart';


class EstructuraScreen extends StatelessWidget {
  const EstructuraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [BackgroundWidget(), EstructuraSplashWidget()],
      ),
      // bottomNavigationBar: const BottonNavigation(),
    );
  }
}
