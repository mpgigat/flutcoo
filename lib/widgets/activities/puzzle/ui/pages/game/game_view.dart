// ignore_for_file: camel_case_types

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebaflutter1/widgets/activities/puzzle/ui/pages/game/controller/game_controller.dart';
import 'package:pruebaflutter1/widgets/activities/puzzle/ui/pages/game/widgets/game_buttons.dart';
import 'package:pruebaflutter1/widgets/activities/puzzle/ui/pages/game/widgets/loading.dart';
import 'package:pruebaflutter1/widgets/activities/puzzle/ui/pages/game/widgets/puzzle_interactor.dart';
import 'package:pruebaflutter1/widgets/activities/puzzle/ui/pages/game/widgets/time_and_moves.dart';
import 'package:pruebaflutter1/widgets/commons/backwidget.dart';
import 'package:pruebaflutter1/widgets/commons/buttonWidget.dart';

import '../../utils/time_parser.dart';

class GameView extends StatefulWidget {
  const GameView({Key? key, required this.rutaAssets, required this.tittle})
      : super(key: key);

  final String rutaAssets;
  final String tittle;

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
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
      : ChangeNotifierProvider(
          create: (_) {
            final controller = GameController();
            controller.onFinish.listen(
              (_) {
                //Function for controller the time
                Timer(
                  const Duration(
                    milliseconds: 100,
                  ),
                  () {
                    _showWinnerDialog(context, controller);
                  },
                );
              },
            );
            return controller;
          },
          child: Scaffold(
            body: Stack(
              children: [
                PuzzleSplashWidget(
                  rutaAssets: widget.rutaAssets,
                  tittle: widget.tittle,
                ),
                const BackWidget(ruta: "identidadscreen"),
              ],
            ),
          ),
        );
}

class PuzzleSplashWidget extends StatelessWidget {
  const PuzzleSplashWidget({
    super.key,
    required this.rutaAssets,
    required this.tittle,
  });

  final String rutaAssets;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Bg_Widget(),
          const Bg_Form_Widget(),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  //padding arriba 10 abajo 15
                  padding: const EdgeInsets.only(top: 60, bottom: 25),
                  child: Text(
                    tittle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),

                const TimeAndMoves(),
                //square for game
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PuzzleInteractor(
                      rutaAssets: rutaAssets,
                    ),
                  ),
                ),
                const GameButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container Bg_Widget() {
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

class Bg_Form_Widget extends StatelessWidget {
  const Bg_Form_Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -110,
      child: Transform.rotate(
          angle: pi / 6,
          child: Container(
            width: 460,
            height: 360,
            decoration: BoxDecoration(
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

//method to show the winner dialog when the game is finished
void _showWinnerDialog(
  BuildContext context,
  GameController controller,
) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("FELICITACIONES!!!"),
          Text(
            "Movimientos: ${controller.state.moves}",
          ),
          Text("Tiempo: ${parseTime(controller.time.value)}"),
          const SizedBox(height: 20),
          TextButton(
            child: const ButtonWidget(textButton: "Aceptar", ruta: ""),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    ),
  );
}
