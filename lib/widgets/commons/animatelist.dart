import 'package:flutter/material.dart';
import 'package:pruebaflutter1/providers/models/menumodel.dart';
import 'package:pruebaflutter1/widgets/commons/cardmenuwidget.dart';

class AnimateListWidget extends StatefulWidget {
  const AnimateListWidget({super.key});

  @override
  State<AnimateListWidget> createState() => _AnimateListWidgetState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _AnimateListWidgetState extends State<AnimateListWidget>
    with TickerProviderStateMixin {
  // late final AnimationController _controller = AnimationController(
  //   duration: const Duration(seconds: 2),
  //   vsync: this,
  // )..repeat(reverse: true);

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..reverse(from: 1);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double smallLogo = 100;
    const double bigLogo = 200;
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

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Size biggest = constraints.biggest;
        return Stack(
          children: <Widget>[
            PositionedTransition(
              rect: RelativeRectTween(
                begin: RelativeRect.fromSize(
                    const Rect.fromLTWH(-50, -50, smallLogo, smallLogo),
                    biggest),
                end: RelativeRect.fromSize(
                    Rect.fromLTWH(biggest.width - bigLogo,
                        biggest.height - bigLogo, bigLogo, bigLogo),
                    biggest),
              ).animate(CurvedAnimation(
                parent: _controller,
                curve: Curves.elasticInOut,
              )),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: CardMenuWidget(
                  menuModel: menu[0],
                  color1: const Color(0xfffd6220),
                  color2: const Color.fromARGB(255, 209, 97, 49),
                  color3: const Color.fromARGB(202, 243, 177, 54),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
