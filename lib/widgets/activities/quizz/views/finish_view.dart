import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebaflutter1/widgets/activities/quizz/data/questions_control.dart';


class FinishScreen extends StatelessWidget {
  const FinishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionsDate questionDate = Get.put(QuestionsDate());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              //insertar imagen sobre el texto
              const Spacer(flex: 5,),
              const Image(image: AssetImage('assets/activities/quizz/logo.png'),),
              const Spacer(flex: 1,),
              const Text("Fin del Quizz",
                  style:TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 120, 80, 1),
                    fontFamily: "system-ui",
                  ),
              ),
              Text("Puntaje:  ${questionDate.numOfCorrectAns * 20 }/100",
                  style:const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255,102,0, 1),
                    fontFamily: "system-ui",
                  ),
              ),
              const Spacer(flex: 5,),
            ]
          )
        ],
      ),
    );
  }
}
