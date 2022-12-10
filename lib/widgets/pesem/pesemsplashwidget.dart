import 'package:flutter/material.dart';
import 'package:pruebaflutter1/providers/models/menumodel.dart';
import 'package:pruebaflutter1/widgets/commons/backwidget.dart';
import 'package:pruebaflutter1/widgets/commons/buttonWidget.dart';
import 'package:pruebaflutter1/widgets/commons/cardmenuwidget.dart';
import 'package:pruebaflutter1/widgets/commons/generaltext.dart';
import 'package:pruebaflutter1/widgets/commons/headerwidget.dart';

class PesemSplashWidget extends StatelessWidget {
  const PesemSplashWidget({super.key});

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
        tittleCard: "COLEGIO COOPERATIVO",
        subTittleCard: "Es una inst",
        ruta: "colegioscreen",
        image: "assets/pesem/university.png",
      ),
      MenuModel(
          tittleCard: "INSTITUTO COOMULDESA",
          subTittleCard: "El Instituto Coomuldesa Marco Fidel Reyes Afanador",
          ruta: "institutoscreen",
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
              icon: Icons.assured_workload,
              showIcon: true,
              textTitle: "PROYECTO PESEM",
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
                          "El proyecto educativo, social y empresarial PESEM, está formado por 4 ámbitos de formación los cuales son: ámbito de educación, ámbito de capacitación, ámbito de asistencia técnica y el ámbito de promoción; y a través de ellos se aprueban actividades sociales en beneficio de entidades educativas, de los asociados, empleados y comunidad en general."),
                  const SizedBox(
                    height: 20,
                  ),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
          const ButtonWidget(
            ruta: "wordsearch",
            textButton: "Actividad",
          )
        ],
      ),
    );
  }
}

// class PosibleCardWidget extends StatelessWidget {
//   const PosibleCardWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           height: 100,
//           width: 105,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: const Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(12),
//                     child: const Icon(Icons.supervisor_account,
//                         size: 24, color: Colors.blueAccent),
//                   ),
//                   Container(
//                     child: const Text(
//                       "2100",
//                       style: TextStyle(
//                         color: Colors.blueAccent,
//                       ),
//                     ),
//                     padding: const EdgeInsets.all(12),
//                   ),
//                 ],
//               ),
//               Container(
//                 decoration: const BoxDecoration(
//                     color: Colors.blueAccent,
//                     borderRadius: BorderRadius.only(
//                         bottomRight: Radius.circular(12),
//                         bottomLeft: Radius.circular(12))),
//                 child: const Text("COLEGIO COOPERATIVO"),
//                 padding: const EdgeInsets.all(12),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
