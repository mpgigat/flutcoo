import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:pruebaflutter1/widgets/activities/quizz/data/questions_control.dart';

import '../data/questions.dart';
import 'options_box.dart';

class BoxQuestion extends StatelessWidget {
  const BoxQuestion({
    Key? key,
    required this.question,
  }) : super(key: key);

  final dynamic question;

  @override
  Widget build(BuildContext context) {
    QuestionsDate questionsDate = Get.put(QuestionsDate());
    return Container(
      margin: const EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 30),
      padding: const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      question.question,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Barlow",
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    ...List.generate(
                      question.options.length,
                      (index) => BoxOption(
                        text: question.options[index],
                        selected: () => questionsDate.checkAns(question, index),
                        index: index,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
