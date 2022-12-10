import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:pruebaflutter1/widgets/activities/puzzle/ui/pages/game/widgets/puzzle_tile.dart';

import '../controller/game_controller.dart';
import '../controller/game_state.dart';

class PuzzleInteractor extends StatelessWidget {
  const PuzzleInteractor({Key? key, required this.rutaAssets}) : super(key: key);
  
  final String rutaAssets;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: LayoutBuilder(
        //calculate the size of the screen and divide in 3 (crossAxisCount)
        builder: (context, constraints) {
          final controller = context.watch<GameController>();
          final state = controller.state;
          final tileSize = constraints.maxWidth / state.crossAxisCount;

          //return the tiles and position them in the screen
          return AbsorbPointer(
            absorbing: state.status != GameStatus.playing,
            child: Stack(
              children: state.puzzle.tiles
                  .map(
                    (e) => PuzzleTile(
                      tile: e,
                      size: tileSize,
                      rutaAssets: rutaAssets,
                      onTap: () => controller.onTileTapped(e),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
