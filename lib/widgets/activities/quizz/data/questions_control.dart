import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruebaflutter1/widgets/activities/quizz/data/questions.dart';
import 'package:pruebaflutter1/widgets/activities/quizz/views/finish_view.dart';



class QuestionsDate extends GetxController
  // ignore: deprecated_member_use
  with SingleGetTickerProviderMixin {


  //Deshabilitar el scroll horizontal entre preguntas
  PageController _pageController = PageController(initialPage: 0);
  PageController get pageController => _pageController;


  final List<Question> questionsDate = questions
      .map((question) =>
      Question(
          id: question["id"],
          question: question["question"],
          options: question["options"],
          answer: question["answer"]))
      .toList();


  List<Question> get question => questionsDate;


  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int? _correctAns ;
  int get correctAns => _correctAns!;

  int? _selectedAns;
  int get selectedAns => _selectedAns!;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;


  @override
  void onInit() {
    _pageController = PageController(initialPage: 0);


    super.onInit();
  }


  //Verificar si la respuesta es correcta
  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer!;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
    }

    update();

    //Funcion para que se muestre la siguiente pregunta despues de 2 segundo
    Future.delayed(const Duration(seconds: 2), () {
      nextQuestion();
    });

  }

  void nextQuestion() {


    if (_questionNumber.value != questionsDate.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.ease);

      _questionNumber.value++;
      print("siguiente pregunta");
    }else {
      //mostrar por consola el numero de respuestas correctas
      print("termino el quizz");
      //abrir la vista de finalizacion usando un contexto sin usar Get.to

      Get.to(FinishScreen());

    }


  }



  void getNumQuestion(int index) {
    _questionNumber.value = index + 1;

  }

}

