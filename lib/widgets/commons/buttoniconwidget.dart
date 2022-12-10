import 'package:flutter/material.dart';

class ButtonIconWidget extends StatelessWidget {
  const ButtonIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 58,
        // width: 58 + (200 * _signUpMoveAnimation.value),
        width: 150,
        decoration: const BoxDecoration(
          // borderRadius:
          //     BorderRadius.circular(8 + 32 * (1 - _signUpMoveAnimation.value)),
          color: Color(0xff005c3d),
        ),
        child: InkWell(
          key: const ValueKey('Sign Up button'),
          onTap: (() {
       
            Navigator.pushReplacementNamed(context, "puzzlecoomuldillo");
          }),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Actividad',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.arrow_forward_rounded, color: Colors.white),
              ],
            ),
          ),
        ));
  }
}
