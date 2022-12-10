import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backwidget.dart';
import 'package:pruebaflutter1/widgets/commons/buttonWidget.dart';
import 'package:pruebaflutter1/widgets/commons/generaltext.dart';
import 'package:pruebaflutter1/widgets/commons/headerwidget.dart';

class QuienesSomosSplashWidget extends StatelessWidget {
  const QuienesSomosSplashWidget({super.key});

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
              icon: Icons.account_balance,
              showIcon: true,
              textTitle: "QUIENES SOMOS",
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
                          "Coomuldesa es una Institución Financiera de naturaleza Cooperativa, especializada en Ahorro y Crédito."),
                  GeneralText(
                      textoShow:
                          "Durante más de 60 años hemos estado al servicio de la comunidad santandereana y desde hace 16 años con el pueblo boyacense, promoviendo el fortalecimiento y el reconocimiento del sector solidario. Con experiencia y responsabilidad se ha diseñado un portafolio de productos y servicios, pensando en usted y en sus negocios, procurando facilitarle comodidad, agilidad y seguridad a sus operaciones financieras."),
                ],
              ),
            ),
          ),
          // const ButtonWidget(
          //   ruta: "actividadquienes",
          //   textButton: "Actividad",
          // )
        ],
      ),
    );
  }
}
