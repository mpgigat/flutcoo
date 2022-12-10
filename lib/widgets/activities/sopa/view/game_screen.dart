import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/commons/backwidget.dart';
import '../widget/crosswordWidget.dart';
import '../loader/loading.dart';

class SopaLetrasScreen extends StatefulWidget {
  const SopaLetrasScreen({super.key});

  @override
  State<SopaLetrasScreen> createState() => _SopaLetrasScreenState();
}

class _SopaLetrasScreenState extends State<SopaLetrasScreen> {
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
          //eliminar el mensaje de debug
          body: SafeArea(
            child: Stack(
              children: const [
                Bg_Widget(),
                Bg_Forma_Widget(),
                CrosswordWidget(),
                BackWidget(ruta: "politicascreen"),
              ],
            ),
          ),
        );
}

class Bg_Forma_Widget extends StatelessWidget {
  const Bg_Forma_Widget({
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

class Bg_Widget extends StatelessWidget {
  const Bg_Widget({
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
