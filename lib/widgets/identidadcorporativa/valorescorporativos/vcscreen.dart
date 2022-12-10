import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backgroundwidget.dart';

import 'package:pruebaflutter1/widgets/identidadcorporativa/valorescorporativos/vcsplashwidget.dart';


class VCScreen extends StatelessWidget {
  const VCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [BackgroundWidget(), VCSPlashWidget()],
      ),
      // bottomNavigationBar: const BottonNavigation(),
    );
  }
}
