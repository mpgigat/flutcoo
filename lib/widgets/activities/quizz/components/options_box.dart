import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebaflutter1/widgets/activities/quizz/data/questions_control.dart';

import '../data/questions.dart';

class BoxOption extends StatelessWidget {
  const BoxOption({
    Key? key,
    this.text,
    this.selected,
    this.index,
  }) : super(key: key);

  final String? text;
  final int? index;
  final VoidCallback? selected;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionsDate>(
      init: QuestionsDate(),
      builder: (qnController) {
        Color getColor() {
          if (qnController.isAnswered) {
            if (index == qnController.correctAns) {
              return Colors.green;
            } else if (index == qnController.selectedAns &&
                qnController.selectedAns != qnController.correctAns) {
              return Colors.red;
            }
          }
          return Colors.grey[600]!;
        }

        IconData getIcon() {
          return getColor() == Colors.green ? Icons.check : Icons.close;
        }

        return InkWell(
          //impedir que se seleccione mas de una opcion al mismo tiempo
          onTap: qnController.isAnswered ? null : selected,
          child: Container(
            margin: const EdgeInsets.only(top: 15),
            padding:
                const EdgeInsets.only(top: 18, bottom: 18, left: 8, right: 8),
            decoration: BoxDecoration(
              border: Border.all(color: getColor(), width: 1.5),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white70,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    index! + 1 == 1
                        ? "A. $text"
                        : index! + 1 == 2
                            ? "B. $text"
                            : index! + 1 == 3
                                ? "C. $text"
                                : "D. $text",
                    style: TextStyle(
                      fontSize: 16,
                      color: getColor(),
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: getColor() == Colors.grey[600]!
                        ? Colors.transparent
                        : getColor(),
                    border: Border.all(color: getColor()),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: getColor() == Colors.white
                      ? null
                      : Icon(
                          getIcon(),
                          size: 20,
                          color: Colors.white,
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
