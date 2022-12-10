// ignore_for_file: camel_case_types

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/activities/puzzle/ui/pages/game/widgets/loading.dart';
import 'package:pruebaflutter1/widgets/commons/backwidget.dart';

import 'wordle_screen.dart';

class GameViewWordSearch extends StatefulWidget {
  const GameViewWordSearch({Key? key}) : super(key: key);

  @override
  State<GameViewWordSearch> createState() => _GameViewWordSearchState();
}

class _GameViewWordSearchState extends State<GameViewWordSearch> {
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
              const bg_widget(),
              const bg_form_widget(),
              const BackWidget(ruta: "pesemscreen"),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const WordleScreen(),
              ),
            ],
          ),
        );
}

class bg_form_widget extends StatelessWidget {
  const bg_form_widget({
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

class bg_widget extends StatelessWidget {
  const bg_widget({
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
