import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backwidget.dart';
import 'package:pruebaflutter1/widgets/commons/buttonWidget.dart';
import 'package:pruebaflutter1/widgets/commons/callsoundwidget.dart';
import 'package:pruebaflutter1/widgets/commons/generaltext.dart';
import 'package:pruebaflutter1/widgets/commons/headerwidget.dart';

class ResenaSplashWidget extends StatelessWidget {
  const ResenaSplashWidget({super.key});

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
              icon: Icons.hourglass_bottom,
              showIcon: true,
              textTitle: "RESEÑA HISTORICA",
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
                      "La Cooperativa de Ahorro y Crédito para El Desarrollo Solidario de Colombia, “Coomuldesa” fue fundada el 29 de junio de 1962 por un grupo de 34 agricultores y pequeños comerciantes de la población de Galán Santander"),
              CallSound(
                tittle: 'RESEÑA HISTORICA',
                subTitle:
                    'Profundiza aún más en la reseña histórica de nuestra cooperativa',
                soundCard: "assets/sounds/rhsound.mp3",
                duration: '22 seg',
              ),
            ],
          ))),
          const ButtonWidget(
            ruta: "quizzscreen",
            textButton: "Actividad",
          )
        ],
      ),
    );
  }
}
