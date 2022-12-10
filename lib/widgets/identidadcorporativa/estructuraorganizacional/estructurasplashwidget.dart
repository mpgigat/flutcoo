import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backwidget.dart';
import 'package:pruebaflutter1/widgets/commons/buttonWidget.dart';
import 'package:pruebaflutter1/widgets/commons/callsoundwidget.dart';
import 'package:pruebaflutter1/widgets/commons/headerwidget.dart';

class EstructuraSplashWidget extends StatelessWidget {
  const EstructuraSplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double headerHeight = 250;
    return Scaffold(
      body: Stack(
        children: [
          ContenidoWidget(headerHeight: headerHeight),
          const BackWidget(ruta: "identidadscreen"),
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
              icon: Icons.pivot_table_chart,
              showIcon: true,
              textTitle: "ORGANIGRAMA GENERAL",
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Expanded(
            child: Center(
                child: InteractiveViewer(
                    boundaryMargin: const EdgeInsets.all(20),
                    minScale: 0.1,
                    maxScale: 3,
                    child: Image.asset('assets/ic/organigrama.jpg'))),
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
