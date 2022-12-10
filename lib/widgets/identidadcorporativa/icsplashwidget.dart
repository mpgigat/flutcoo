import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/animationtypedtext.dart';
import 'package:pruebaflutter1/widgets/commons/backwidget.dart';
import 'package:pruebaflutter1/widgets/commons/buttonWidget.dart';
import 'package:pruebaflutter1/widgets/commons/generaltext.dart';
import 'package:pruebaflutter1/widgets/commons/headerwidget.dart';

class ICSplahsWidget extends StatelessWidget {
  const ICSplahsWidget({super.key});

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
              icon: Icons.shield_outlined,
              showIcon: true,
              textTitle: "IDENTIDAD CORPORATIVA",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const GeneralText(
              textoShow:
                  "Descubre a  continuación nuestra imagen corporativa, cuáles son las variables que la integran y que nos hace diferentes."),
          const GeneralText(
              textoShow:
                  "Identificaras los principios éticos bajo los cuales actuamos y también, los símbolos específicos que determinan nuestra imagen corporativa, símbolos que hoy facilitan la identificación de nuestra cooperativa en los diferentes entornos y despiertan sentimientos propios entre quienes la han visto crecer."),
          const SizedBox(
            height: 5,
          ),
          const AnimationTypedText(
            texto:
                "Antes de realizar la actividad, haz clic en el Icono de la esquina inferior derecha y explora nuestra identidad corporativa!!!",
            fontSizeParam: 20,
            colorLetra: Color(0xfffd6220),
          ),
          const SizedBox(
            height: 20,
          ),
          const ButtonWidget(
            ruta: "actividadquienes",
            textButton: "Actividad",
          )
        ],
      ),
    );
  }
}
