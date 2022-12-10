import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backwidget.dart';
import 'package:pruebaflutter1/widgets/commons/buttonWidget.dart';
import 'package:pruebaflutter1/widgets/commons/generaltext.dart';
import 'package:pruebaflutter1/widgets/commons/headerwidget.dart';

class InstitutoSplashWidget extends StatelessWidget {
  const InstitutoSplashWidget({super.key});

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
              icon: Icons.business,
              showIcon: true,
              textTitle: "INSTITUTO COOMULDESA",
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
                          "El Instituto Coomuldesa Marco Fidel Reyes Afanador, Nace a raíz de proporcionarle a la Fundación Coomuldesa, un amparo jurídico para desarrollar la actividad de educación no formal, que le permitiera cumplir con los objetivos del proyecto de educación social y empresarial PESEM de su cooperativa."),
                  GeneralText(
                      textoShow:
                          "Su nombre hace reconocimiento al presbítero Marco Fidel Reyes q.e.p.d (MARFILES), conocido por ser el gestor y cofundador de gran cantidad de organizaciones cooperativas de la región del país."),
                  GeneralText(
                      textoShow:
                          "Obtiene la declaración como instituto de educación no formal el 21 de enero de 2005 mediante resolución 01144 de la Secretaria de Educación Departamental."),
                ],
              ),
            ),
          ),
          // const ButtonWidget(
          //   ruta: "actvidadpolitica",
          //   textButton: "Actividad",
          // )
        ],
      ),
    );
  }
}
