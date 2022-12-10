import 'package:flutter/material.dart';

import '../../../utils/time_parser.dart';
import '../controller/game_controller.dart';
//importar provider
import 'package:provider/provider.dart';

class TimeAndMoves extends StatelessWidget {
  const TimeAndMoves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = Provider.of<GameController>(context, listen: false).time;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ValueListenableBuilder<int>(
          valueListenable: time,
          builder: (_, time, icon) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  icon!,
                  Text(
                    parseTime(time),
                    style: const TextStyle(
                        fontSize: 20, color: Color.fromARGB(176, 0, 0, 0)),
                  ),
                ],
              ),
            );
          },
          child: const Icon(
            Icons.watch,
            size: 30,
            color: Color.fromARGB(176, 0, 0, 0),
          ),
        ),
        Selector<GameController, int>(
          builder: (_, moves, __) {
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text("Intentos: $moves",
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(176, 0, 0, 0))),
            );
          },
          selector: (_, controller) => controller.state.moves,
        ),
      ],
    );
  }
}
