import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backwidget.dart';
import 'package:pruebaflutter1/widgets/commons/buttonWidget.dart';
import 'package:pruebaflutter1/widgets/commons/headerwidget.dart';

class MVSplashWidget extends StatelessWidget {
  const MVSplashWidget({super.key});

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
    final List<String> imageList = [
      'assets/ic/mision.jpg',
      'assets/ic/vision.jpg'
    ];
    return Positioned(
      //top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
      child: Column(
        children: [
          SizedBox(
            height: headerHeight,
            child: HeaderWidget(
              height: headerHeight,
              icon: Icons.ssid_chart,
              showIcon: true,
              textTitle: "MISION - VISION",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: MVCarousel(imageList: imageList))),
          const ButtonWidget(
            ruta: "puzzlevision",
            textButton: "Actividad",
          )
        ],
      ),
    );
  }
}

class MVCarousel extends StatelessWidget {
  const MVCarousel({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: imageList.length,
        itemBuilder: (context, i, id) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imageList[i],
                  // width: 500,
                  fit: BoxFit.cover,
                )),
          );
        },
        options: CarouselOptions(
            aspectRatio: 5,
            enlargeCenterPage: true,
            height: 300,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            reverse: false));
  }
}
