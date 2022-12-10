import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/acordeonwidget.dart';
import 'package:pruebaflutter1/widgets/commons/backwidget.dart';
import 'package:pruebaflutter1/widgets/commons/buttonWidget.dart';

import 'package:pruebaflutter1/widgets/commons/headerwidget.dart';

class VCSPlashWidget extends StatelessWidget {
  const VCSPlashWidget({super.key});

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
              icon: Icons.corporate_fare,
              showIcon: true,
              textTitle: "VALORES CORPORATIVOS",
            ),
          ),
          const Expanded(
              child: SingleChildScrollView(child: AcordeonValoresWidget())),
          const ButtonWidget(
            ruta: "crosswordscreen",
            textButton: "Actividad",
          ),
        ],
      ),
    );
  }
}

class AcordeonValoresWidget extends StatelessWidget {
  const AcordeonValoresWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AcordeonWidget(
            title: "Integridad",
            content:
                'Actuamos dentro de los más rigurosos principios éticos y legales.'),
        AcordeonWidget(
            title: "Transparencia",
            content: 'Actuamos de manera clara, consciente y oportuna.'),
        AcordeonWidget(
            title: "Respeto por las personas",
            content:
                'Somos un factor de desarrollo de las comunidades en donde estamos presentes.'),
        AcordeonWidget(
            title: "Actitud de servicio",
            content:
                'Somos amables, oportunos y eficaces en la prestación de nuestros servicios.'),
        AcordeonWidget(
            title: "Trabajo en equipo",
            content:
                'Superamos continuamente nuestras metas y optimizamos el uso de recursos, para crear valor.'),
        AcordeonWidget(
            title: "Alto desempeño",
            content:
                'Somos un factor de desarrollo de las comunidades en donde estamos presentes.'),
        AcordeonWidget(
            title: "Orientación al asociado",
            content:
                'Construimos relaciones de largo plazo con nuestros asociados, que son nuestra razón de ser.'),
        AcordeonWidget(
            title: "Actitud positiva",
            content:
                'Disfrutamos de lo que hacemos y estamos en búsqueda permanente de posibilidades.'),
        AcordeonWidget(
            title: "Confianza",
            content:
                'Generamos credibilidad y manejamos responsablemente la información.'),
      ],
    );
  }
}

class TextoValorWidget extends StatelessWidget {
  const TextoValorWidget({
    Key? key,
    required this.textValue,
  }) : super(key: key);
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 16, bottom: 16),
      child: Text(
        textValue,
        textAlign: TextAlign.justify,
        style: const TextStyle(
            height: 1.2, // the height between text, default is null
            letterSpacing: 1.0 //
            ),
      ),
    );
  }
}
