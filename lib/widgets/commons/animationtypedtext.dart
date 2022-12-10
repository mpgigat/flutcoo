import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimationTypedText extends StatelessWidget {
  const AnimationTypedText(
      {super.key,
      required this.texto,
      required this.fontSizeParam,
      required this.colorLetra});
  final String texto;
  final double fontSizeParam;
  final Color colorLetra;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: SizedBox(
        //width: 300.0,
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: fontSizeParam,
            fontFamily: 'Agne',
            fontWeight: FontWeight.bold,
            color: colorLetra,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              //      TypewriterAnimatedText('Identidad Corporativa'),
              TypewriterAnimatedText(
                texto,
              )
            ],
            // onTap: () {
            //   print("Tap Event");
            // },
          ),
        ),
      ),
    ));
  }
}
