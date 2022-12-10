import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backwidget.dart';
import 'package:pruebaflutter1/widgets/commons/buttonWidget.dart';
import 'package:pruebaflutter1/widgets/commons/generaltext.dart';
import 'package:pruebaflutter1/widgets/commons/headerwidget.dart';

class ColegioSplashWidget extends StatelessWidget {
  const ColegioSplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double headerHeight = 250;
    return Scaffold(
      body: Stack(
        children: [
          ContenidoWidget(headerHeight: headerHeight),
          const BackWidget(ruta: "pesemscreen"),
        ],
      ),
    );
  }
}

class ContenidoWidget extends StatelessWidget {
  const ContenidoWidget({
    Key? key,
    required this.headerHeight,
  }) : super(key: key);

  final double headerHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      //top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
      child: Column(
        children: [
          SizedBox(
            height: headerHeight,
            child: HeaderWidget(
              height: headerHeight,
              icon: Icons.cast_for_education,
              showIcon: true,
              textTitle: "COLEGIO COOPERATIVO",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  GeneralText(
                      textoShow:
                          "El COLEGIO COOPERATIVO es un establecimiento educativo enfocado en ofrecer una educación que desarrolle todas las dimensiones humanas promoviendo una cultura cooperativa y solidaria en preescolar, básica primaria, básica secundaria y educación media."),
                  GeneralText(
                      textoShow:
                          "Contamos con planta física propia, amplia y moderna, ubicada en el municipio de San Gil (Col.), en una región con amplia trayectoria en trabajo comunitario, economía solidaria, expresión artística, comercio y turismo."),
                ],
              ),
            ),
          ),
          // const ButtonWidget(
          //   ruta: "wordsearch",
          //   textButton: "Actividad",
          // )
        ],
      ),
    );
  }
}
