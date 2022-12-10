import 'package:flutter/material.dart';

import '../../../../domain/models/tile.dart';

class PuzzleTile extends StatelessWidget {
  final Tile tile;
  final double size;
  final VoidCallback onTap;
  final String rutaAssets;
  
  const PuzzleTile({
    Key? key,
    required this.tile,
    required this.size,
    required this.onTap,
    required this.rutaAssets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(
        milliseconds: 220,
      ),

      //position of the tile
      left: (tile.position.x - 1) * size,
      top: (tile.position.y - 1) * size,

      //container of the each tile
      child: Container(
        //color the box
        color: Colors.white,
        width: size,

        //detect the tap on the tile
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            //image of the box
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    //'assets/activities/puzzle/coomuldillo/coomuldillo${tile.value.toString()}.png'),
                    '$rutaAssets${tile.value.toString()}.png'),
                fit: BoxFit.cover,
              ),
            ),

            //space between the image and the box
            margin: const EdgeInsets.all(1.5),
            width: size - 2,
            height: size - 2,
            //ubicar el texto en la parte superior izquierda
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  tile.value.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
