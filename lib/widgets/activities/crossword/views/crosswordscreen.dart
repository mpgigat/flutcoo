import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backwidget.dart';

import '../loader/loading.dart';
import '../widgets/croosword.dart';

class CrossWordScreen extends StatefulWidget {
  const CrossWordScreen({super.key});

  @override
  State<CrossWordScreen> createState() => _CrossWordScreenState();
}

class _CrossWordScreenState extends State<CrossWordScreen> {
  bool? isLoading = true;

  //ejecutar la funcion asincrona en el initState
  @override
  void initState() {
    super.initState();
    _showLoading();
  }

  //funcion asincrona para esperar a que se cargue la pagina y mientras se muestra el loading
  Future<void> _showLoading() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) => isLoading!
      ? const LoadingPage()
      : Scaffold(
          body: Stack(
            children: [
              const BgScreen(),
              const Bgform(),
              const BackWidget(ruta: "valorescorporativosscreen"),
              Container(
                margin: const EdgeInsets.only(top: 55),
                child: const CrossWord(),
              ),
            ],
          ),
        );
}

class BgScreen extends StatelessWidget {
  const BgScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
//aplicar un gradiente al fondo de arriba a abajo
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(227, 245, 138, 16),
            Color.fromARGB(138, 240, 199, 137),
          ],
        ),
      ),
    );
  }
}

class Bgform extends StatelessWidget {
  const Bgform({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -100,
      child: Transform.rotate(
          angle: pi / 7,
          child: Container(
            width: 460,
            height: 360,
            decoration: BoxDecoration(
              //hacer que el elemento se vea como un circulo
              borderRadius: BorderRadius.circular(50),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 148, 212, 158),
                  Color.fromARGB(204, 24, 170, 24),
                ],
              ),
            ),
          )),
    );
  }
}
