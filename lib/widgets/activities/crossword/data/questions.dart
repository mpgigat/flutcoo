

//class that define the questions and answers of the crossword
class Question {
  final dynamic idQuestion;
  final String? questionText;
  final String? answerText;
  late final bool? isAnswered;

  Question(
      {required this.idQuestion,
      required this.questionText,
      required this.answerText,
      required this.isAnswered
      });
}

class Answer {
  final String answerText;

  Answer(this.answerText);
}

//list of questions and answers
List<Question> getQuestions() {
  List<Question> questions = [];

  //add questions and answers at the list
  questions.add(Question(
      idQuestion: "! Oprime un número para empezar!",
      questionText: "",
      answerText: null,
      isAnswered: true));

  questions.add(Question(
      idQuestion: 1,
      questionText: ' Disfrutamos de lo que hacemos y estamos en busca permanente de posibilidades',
      answerText: 'actitud-positiva',
      isAnswered: false));

  questions.add(Question(
      idQuestion: 2,
      questionText: ' Generamos credibilidad y manejamos responsablemente la información',
      answerText: 'confianza',
      isAnswered: false));

  questions.add(Question(
      idQuestion: 3,
      questionText: ' Actuamos dentro de los más rigurosos principios éticos y legales',
      answerText: 'integridad',
      isAnswered: false));


  questions.add(Question(
      idQuestion: 4,
      questionText: ' Actuamos de manera clara, consiente y oportuna',
      answerText: 'transparencia',
      isAnswered: false));

  questions.add(Question(
      idQuestion: 5,
      questionText: ' Centro de Administración Documental',
      answerText: 'cad',
      isAnswered: false));


  questions.add(Question(
      idQuestion: 6,
      questionText: ' Gerencia a la cual hacen parte las oficinas de COOMULDESA',
      answerText: 'comercial',
      isAnswered: false));


  return questions;
}
