import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/question_box.dart';
import '../data/questions_control.dart';

class QuizzView extends StatelessWidget {
  const QuizzView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionsDate questionsList = Get.put(QuestionsDate());
    return SafeArea(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Container(
            width: double.infinity,
            height: 38,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 102, 0, 0.8),
              border: Border.all(
                  color: const Color.fromRGBO(0, 120, 80, 0.8), width: 3),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Obx(
                    () => Container(
                      width: constraints.maxWidth *
                          (questionsList.questionNumber /
                              questionsList.question.length),
                      //color con gradient
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(0, 180, 80, 0.8),
                            Color.fromRGBO(0, 120, 80, 0.8)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Obx(
                          () => Text(
                            "Pregunta ${questionsList.questionNumber.value}/${questionsList.question.length}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: "system-ui",
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: questionsList.getNumQuestion,
            controller: questionsList.pageController,
            itemCount: questionsList.question.length,
            // ignore: prefer_const_constructors
            itemBuilder: (context, index) => BoxQuestion(
              question: questionsList.question[index],
            ),
          ),
        ),
      ]),
    );
  }
}
