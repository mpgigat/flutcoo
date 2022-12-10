import 'package:flutter/material.dart';
import 'package:pruebaflutter1/providers/models/menumodel.dart';
import 'package:pruebaflutter1/widgets/commons/cardmenuwidget.dart';

class HomeCardsWidget extends StatelessWidget {
  const HomeCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuModel> menu = [
      MenuModel(
        tittleCard: "QUIENES SOMOS",
        subTittleCard: "Es una inst",
        ruta: "quienesscreen",
        image: "assets/menu/somos.PNG",
      ),
      MenuModel(
          tittleCard: "RESEÑA HISTORICA",
          subTittleCard: "El Instituto Coomuldesa Marco Fidel Reyes Afanador",
          ruta: "resenascreen",
          image: "assets/menu/historica.PNG"),
      MenuModel(
        tittleCard: "IDENTIDAD CORPORATIVA",
        subTittleCard: "Es una inst",
        ruta: "identidadscreen",
        image: "assets/ic/coomuldillo.jpg",
      ),
      MenuModel(
          tittleCard: "POLITICA DE CALIDAD",
          subTittleCard: "El Instituto Coomuldesa Marco Fidel Reyes Afanador",
          ruta: "politicascreen",
          image: "assets/menu/politica.PNG"),
      MenuModel(
          tittleCard: "PROYECTO PESEM",
          subTittleCard: "El Instituto Coomuldesa Marco Fidel Reyes Afanador",
          ruta: "pesemscreen",
          image: "assets/menu/pesem.webp"),
    ];

    return Column(
      children: [
        Expanded(
            child: Column(
          children: [
            const TittleAppWidget(),
            const SubTitleWidget(),
            const SizedBox(
              height: 16,
            ),
            Expanded(
                child:
                    SingleChildScrollView(child: ListCardsWidget(menu: menu)))
          ],
        )),
      ],
    );
  }
}

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20
          //top: 3,
          ),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Interactúa con nuestra aplicación, desarrolla las actividades y aprende más sobre nuestra cooperativa",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: "Quicksand",
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class TittleAppWidget extends StatelessWidget {
  const TittleAppWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        top: 40,
      ),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Insitituto Coomuldesa",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: "Quicksand",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ListCardsWidget extends StatefulWidget {
  const ListCardsWidget({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final List<MenuModel> menu;

  @override
  State<ListCardsWidget> createState() => _ListCardsWidgetState();
}

class _ListCardsWidgetState extends State<ListCardsWidget>
    with SingleTickerProviderStateMixin {
  // late Animation<double> animation;
  // late AnimationController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardMenuWidget(
          menuModel: widget.menu[0],
          color1: const Color(0xfffd6220),
          color2: const Color.fromARGB(255, 209, 97, 49),
          color3: const Color.fromARGB(202, 243, 177, 54),
        ),
        CardMenuWidget(
          menuModel: widget.menu[1],
          color1: const Color(0xfffd6220),
          color2: const Color.fromARGB(213, 202, 136, 12),
          color3: const Color.fromARGB(255, 100, 231, 106),
        ),
        CardMenuWidget(
          menuModel: widget.menu[2],
          color1: const Color(0xfffd6220),
          color2: const Color.fromARGB(162, 130, 136, 46),
          color3: const Color.fromARGB(185, 78, 80, 206),
        ),
        CardMenuWidget(
          menuModel: widget.menu[3],
          color1: const Color(0xfffd6220),
          color2: const Color.fromARGB(235, 216, 189, 68),
          color3: const Color.fromARGB(192, 219, 97, 199),
        ),
        CardMenuWidget(
          menuModel: widget.menu[4],
          color1: const Color(0xfffd6220),
          color2: const Color.fromARGB(211, 238, 205, 57),
          color3: const Color.fromARGB(197, 240, 72, 100),
        ),
      ],
    );
  }
}
