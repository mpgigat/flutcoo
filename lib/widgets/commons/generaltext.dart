import 'package:flutter/material.dart';

class GeneralText extends StatelessWidget {
  const GeneralText({super.key, required this.textoShow});
  final String textoShow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 16, bottom: 16),
      child: Text(
        textoShow,
        textAlign: TextAlign.justify,
        style: const TextStyle(
            height: 1.2, // the height between text, default is null
            letterSpacing: 1.0 //
            ),
      ),
    );
  }
}
