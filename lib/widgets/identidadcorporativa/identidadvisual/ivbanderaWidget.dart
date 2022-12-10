// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class IVBanderaWidget extends StatelessWidget {
  const IVBanderaWidget({super.key, required this.animationController});
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _textAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-2, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _imageAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-4, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final _relaxAnimation =
        Tween<Offset>(begin: const Offset(0, -2), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _relaxAnimation,
                child: const Text(
                  "La Bandera",
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
              ),
              SlideTransition(
                position: _textAnimation,
                child: const Padding(
                  padding:
                      EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16),
                  child: Text(
                    "Presentamos, en primer lugar, la bandera de la entidad con sus colores institucionales básicos: verde, blanco y naranja, que reflejan la fuerza del agro, la transparencia en el manejo administrativo y el brillo del sol naciente irradiado sobre las ciudades y los campos, acompañados con la presencia del arco iris como prueba de su compromiso con el cooperativismo universal.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SlideTransition(
                position: _imageAnimation,
                child: Container(
                  constraints:
                      const BoxConstraints(maxWidth: 350, maxHeight: 250),
                  child: Image.asset(
                    'assets/ic/bandera.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
