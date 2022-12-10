import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.textButton, required this.ruta});
  final String textButton;
  final String ruta;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 7),
        child: ElevatedButton(
          // ignore: prefer_const_constructors
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 23),
            ),
            backgroundColor: MaterialStateProperty.all(const Color(0xff005c3d)),
          ),
          child: Container(
            width: 150,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textButton,
                ),
                const Icon(Icons.arrow_forward_rounded, color: Colors.white),
              ],
            ),
          ),
          onPressed: () {
            if (ruta == "") {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, ruta);
            }
          },
        ),
      ),
    );
  }
}
