
import 'package:flutter/material.dart';
import 'package:pruebaflutter1/providers/models/menumodel.dart';
import 'package:pruebaflutter1/utils/text_styles.dart';

class CardMenuWidget extends StatelessWidget {
  const CardMenuWidget({
    Key? key,
    required this.menuModel,
    required this.color1,
    required this.color2,
    required this.color3,
  }) : super(key: key);

  final MenuModel menuModel;
  final Color color1;
  final Color color2;
  final Color color3;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, menuModel.ruta);
      },
      child: Container(
          margin: const EdgeInsets.only(
            top: 16.0,
            bottom: 16.0,
            left: 24.0,
            right: 24.0,
          ),
          child: Stack(
            children: <Widget>[
              CardStyleWidget(
                  menuModel: menuModel,
                  color1: color1,
                  color2: color2,
                  color3: color3),
              CardImage(
                imagenCard: menuModel.image,
              ),
            ],
          )),
    );
  }
}

class CardStyleWidget extends StatelessWidget {
  const CardStyleWidget({
    Key? key,
    required this.menuModel,
    required this.color1,
    required this.color2,
    required this.color3,
  }) : super(key: key);

  final MenuModel menuModel;
  final Color color1;
  final Color color2;
  final Color color3;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      margin: const EdgeInsets.only(left: 24.0),
      decoration: BoxDecoration(
        //  color: const Color(0xFF333366),
        gradient: LinearGradient(
            // begin: Alignment.topCenter,
            // end: Alignment.bottomCenter,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            //colors:Color.fromARGB(255, 214, 229, 155)B(203, 13, 104, 74)]
            colors: [
              // Color.fromARGB(205, 10, 173, 64),
              // Color.fromARGB(205, 103, 235, 147),
              color1,
              //  color2,
              color3
            ]),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromARGB(36, 0, 0, 0),
            blurRadius: 10.0,
            offset: Offset(0.0, 3.0),
            spreadRadius: 5,
          ),
        ],
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.5),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
      ),
      child: CardContentWidget(
        menuModel: menuModel,
      ),
    );
  }
}

class CardContentWidget extends StatelessWidget {
  const CardContentWidget({
    Key? key,
    required this.menuModel,
  }) : super(key: key);

  final MenuModel menuModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(44.0, 16.0, 16.0, 16.0),
      constraints: const BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Container(height: 40),
          Text(menuModel.tittleCard, style: Style.titleTextStyle),
          // DefaultTextStyle(
          //   style: const TextStyle(
          //     fontSize: 18.0,
          //   ),
          //   child: AnimatedTextKit(
          //     animatedTexts: [
          //       WavyAnimatedText(menuModel.tittleCard),
          //     ],
          //     isRepeatingAnimation: false,
          //     // onTap: () {
          //     //   print("Tap Event");
          //     // },
          //   ),
          // ),
          Container(height: 4.0),
        ],
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  const CardImage({
    Key? key,
    required this.imagenCard,
  }) : super(key: key);
  final String imagenCard;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   margin: const EdgeInsets.symmetric(vertical: 16.0),
    //   alignment: FractionalOffset.centerLeft,
    //   child: Image(
    //     image: AssetImage(imagenCard),
    //     height: 52.0,
    //     width: 52.0,
    //   ),
    // );
    return Container(
      // height: 52,
      // width: 52,
      margin: const EdgeInsets.symmetric(vertical: 14.0),
      alignment: FractionalOffset.centerLeft,
      child: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(imagenCard),
      ),
    );
  }
}
