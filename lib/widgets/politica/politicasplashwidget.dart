import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backwidget.dart';
import 'package:pruebaflutter1/widgets/commons/buttonWidget.dart';
import 'package:pruebaflutter1/widgets/commons/buttoniconwidget.dart';
import 'package:pruebaflutter1/widgets/commons/callsoundwidget.dart';
import 'package:pruebaflutter1/widgets/commons/generaltext.dart';
import 'package:pruebaflutter1/widgets/commons/headerwidget.dart';

class PoliticaSplashWidget extends StatelessWidget {
  const PoliticaSplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double headerHeight = 250;
    return Scaffold(
      body: Stack(
        children: [
          ContenidoWidget(headerHeight: headerHeight),
          const BackWidget(ruta: "homescreen"),
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
              icon: Icons.fact_check_outlined,
              showIcon: true,
              textTitle: "POLITICA DE CALIDAD",
            ),
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: const [
                GeneralText(
                    textoShow:
                        "Coomuldesa es una Institución financiera de naturaleza cooperativa, especializada en ahorro y crédito, con radio de acción nacional, orientada a movilizar el ahorro y el crédito con servicios de calidad, para atender las necesidades financieras de nuestros asociados, procurando el desarrollo social en nuestro territorio. "),
                CallSound(
                  tittle: 'POLITICA DE CALIDAD',
                  subTitle:
                      'Profundiza aún más en la política de calidad de nuestra cooperativa',
                  soundCard: "assets/sounds/pcsound.mp3",
                  duration: '44 seg',
                ),
              ],
            ),
          )),
          const ButtonWidget(
            ruta: "sopaletrasscreen",
            textButton: "Actividad",
          ),
        ],
      ),
    );
  }
}
