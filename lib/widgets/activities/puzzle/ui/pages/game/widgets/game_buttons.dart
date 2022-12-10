import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/game_controller.dart';
import '../controller/game_state.dart';

class GameButtons extends StatelessWidget {
  const GameButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();
    final state = controller.state;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff005c3d),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton.icon(
              onPressed: controller.shuffle,
              icon: const Icon(
                Icons.replay_rounded,
                color: Colors.white,
              ),
              label: Text(
                state.status == GameStatus.created ? "INICIAR" : "REINICIAR",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
