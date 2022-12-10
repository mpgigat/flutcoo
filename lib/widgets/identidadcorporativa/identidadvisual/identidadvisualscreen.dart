import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/identidadcorporativa/identidadvisual/ivbanderaWidget.dart';
import 'package:pruebaflutter1/widgets/identidadcorporativa/identidadvisual/ivcenternextbutton.dart';
import 'package:pruebaflutter1/widgets/identidadcorporativa/identidadvisual/ivhumanizadowidget.dart';
import 'package:pruebaflutter1/widgets/identidadcorporativa/identidadvisual/ivlogotipoWidget.dart';
import 'package:pruebaflutter1/widgets/identidadcorporativa/identidadvisual/ivpiramidewidget.dart';

import 'package:pruebaflutter1/widgets/identidadcorporativa/identidadvisual/ivtopbackskipviewwidget.dart';

class IdentidadVisual extends StatefulWidget {
  const IdentidadVisual({super.key});

  @override
  State<IdentidadVisual> createState() => _IdentidadVisualState();
}

class _IdentidadVisualState extends State<IdentidadVisual>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));
    _animationController?.animateTo(0.2);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ClipRRect(
        child: Stack(
          children: [
            // IVSplashWidget(animationController: _animationController!),
            IVBanderaWidget(animationController: _animationController!),
            IVPiramideWidget(animationController: _animationController!),
            IVLogotipoWidget(animationController: _animationController!),
            IVHumanizadoWidget(animationController: _animationController!),
            IVTobBackSkipViewWidget(
              onBackClick: _onBackClick,
              onSkipClick: _onSkipClick,
              animationController: _animationController!,
            ),
            IVCenterNextButton(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.8,
        duration: const Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      //_animationController?.animateTo(0.0);
      Navigator.pushReplacementNamed(context, "identidadscreen");
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      // _signUpClick();
      
      
    }
  }
}
