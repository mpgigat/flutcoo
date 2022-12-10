import 'package:flutter/material.dart';
import 'package:pruebaflutter1/providers/models/menumodel.dart';
import 'package:pruebaflutter1/widgets/commons/backwidget.dart';
import 'package:pruebaflutter1/widgets/commons/buttonWidget.dart';
import 'package:pruebaflutter1/widgets/commons/cardmenuwidget.dart';
import 'package:pruebaflutter1/widgets/commons/generaltext.dart';
import 'package:pruebaflutter1/widgets/commons/headerwidget.dart';

class IdentidadSplashWidget extends StatelessWidget {
  const IdentidadSplashWidget({super.key});

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
    List<MenuModel> menu = [
      MenuModel(
        tittleCard: "MISION y VISION",
        subTittleCard: "Es una inst",
        ruta: "misionvisionscreen",
        image: "assets/pesem/university.png",
      ),
      MenuModel(
          tittleCard: "VALORES CORPORATIVOS",
          subTittleCard: "El Instituto Coomuldesa Marco Fidel Reyes Afanador",
          ruta: "valorescorporativosscreen",
          image: "assets/pesem/house.png"),
      MenuModel(
        tittleCard: "IDENTIDAD VISUAL",
        subTittleCard: "Es una inst",
        ruta: "identidadvisualscreen",
        image: "assets/pesem/university.png",
      ),
      MenuModel(
          tittleCard: "ESTRUCTURA ORGANIZACIONAL",
          subTittleCard: "El Instituto Coomuldesa Marco Fidel Reyes Afanador",
          ruta: "estructurascreen",
          image: "assets/pesem/house.png"),
    ];

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
              textTitle: "IDENTIDAD CORPORATIVA",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const GeneralText(
                    textoShow:
                        "Descubre a  continuación nuestra imagen corporativa, cuáles son las variables que la integran y que nos hace diferentes."),
                Column(
                  children: [
                    CardMenuWidget(
                      menuModel: menu[0],
                      color1: const Color(0xfffd6220),
                      color2: const Color.fromARGB(255, 209, 97, 49),
                      color3: const Color.fromARGB(202, 243, 177, 54),
                    ),
                    CardMenuWidget(
                      menuModel: menu[1],
                      color1: const Color(0xfffd6220),
                      color2: const Color.fromARGB(213, 202, 136, 12),
                      color3: const Color.fromARGB(255, 100, 231, 106),
                    ),
                    CardMenuWidget(
                      menuModel: menu[2],
                      color1: const Color(0xfffd6220),
                      color2: const Color.fromARGB(162, 130, 136, 46),
                      color3: const Color.fromARGB(185, 78, 80, 206),
                    ),
                    CardMenuWidget(
                      menuModel: menu[3],
                      color1: const Color(0xfffd6220),
                      color2: const Color.fromARGB(235, 216, 189, 68),
                      color3: const Color.fromARGB(192, 219, 97, 199),
                    ),
                  ],
                )
              ],
            ),
          )),
          // const ButtonWidget(
          //   ruta: "actvidadpolitica",
          //   textButton: "Actividad",
          // )
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
