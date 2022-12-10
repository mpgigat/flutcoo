import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/colorsApp.dart';
import '../data/questions.dart';

class CrossWord extends StatefulWidget {
  const CrossWord({Key? key}) : super(key: key);

  @override
  State<CrossWord> createState() => _CrossWordState();
}

class _CrossWordState extends State<CrossWord> {
  //variables
  int answerCount = 0;
  List<Question> questionsList = getQuestions();
  int indexQuestion = 0;
  Map words = {};
  Map Answered = {};

  @override
  Widget build(BuildContext context) {
    //variable of save the value of the input
    String? _inputText;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),

                    //Generate a grid of 15 rows and 15 columns
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 255,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 15,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        //create a container for each grid with a margin top and bottom
                        return Container(
                          decoration: BoxDecoration(
                            color: index >= 16 &&
                                    index <= 250 &&
                                    (index - 16) % 15 == 0
                                ? index == 121
                                    ? colorLetter
                                    : ColorBox
                                : index >= 31 && index <= 39
                                    ? ColorBox
                                    : index >= 24 &&
                                            index <= 159 &&
                                            (index - 24) % 15 == 0
                                        ? ColorBox
                                        : index >= 193 &&
                                                index <= 223 &&
                                                (index - 193) % 15 == 0
                                            ? ColorBox
                                            : index >= 240 && index <= 248
                                                ? ColorBox
                                                : index >= 196 && index <= 208
                                                    ? ColorBox
                                                    : Colors.transparent,
                            border: index >= 16 &&
                                    index <= 250 &&
                                    (index - 16) % 15 == 0
                                ? index == 121
                                    ? Border.all(color: Colors.black, width: 1)
                                    : Border.all(color: Colors.black, width: 1)
                                : index >= 31 && index <= 39
                                    ? Border.all(color: Colors.black, width: 1)
                                    : index >= 24 &&
                                            index <= 159 &&
                                            (index - 24) % 15 == 0
                                        ? Border.all(
                                            color: Colors.black, width: 1)
                                        : index >= 193 &&
                                                index <= 223 &&
                                                (index - 193) % 15 == 0
                                            ? Border.all(
                                                color: Colors.black, width: 1)
                                            : index >= 240 && index <= 248
                                                ? Border.all(
                                                    color: Colors.black,
                                                    width: 1)
                                                : index >= 196 && index <= 208
                                                    ? Border.all(
                                                        color: Colors.black,
                                                        width: 1)
                                                    : Border.all(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),

                          //color each box

                          margin: const EdgeInsets.all(1),

                          //method for paint the letters or numbers of the crossword
                          child: _paintCrossWord(index),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      //color blanco opaco
                      color: Colors.white.withOpacity(0.9),

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          //show the question
                          child: _questionWidget(),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: TextField(
                            //enable the input if the value of indexQuestion is different from 0
                            enabled: indexQuestion != 0,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              //color del borde
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              labelText: 'Respuesta',
                              labelStyle: TextStyle(color: Colors.green),
                            ),

                            //value defect of the input
                            controller: TextEditingController(text: _inputText),

                            cursorColor: Colors.black,

                            onChanged: (value) {
                              //guardar el valor del input en la variable _inputText en mayusculas y sin espacios en blanco en todos los lados

                              _inputText =
                                  value.toUpperCase().replaceAll(' ', '');
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_inputText ==
                                  questionsList[indexQuestion]
                                      .answerText
                                      ?.toUpperCase()
                                      .replaceAll('-', '')) {
                                //evaluates if the answer is correct
                                ScaffoldMessenger.of(context).showSnackBar(
                                  //cambiar el color de la caja a verde
                                  const SnackBar(
                                    content: Text(
                                      'Correcto',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );

                                //add the answer to the map
                                words[indexQuestion] =
                                    questionsList[indexQuestion]
                                        .answerText
                                        ?.toUpperCase();

                                Answered[indexQuestion] = true;

                                setState(() {
                                  if (Answered[1] == true &&
                                      Answered[2] == true &&
                                      Answered[3] == true &&
                                      Answered[4] == true &&
                                      Answered[5] == true &&
                                      Answered[6] == true) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Felicidades'),
                                          content: const Text(
                                              'Has completado el crucigrama'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Continuar'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }

                                  answerCount++;
                                  _inputText = "";
                                });
                              } else {
                                //evaluate if the answer is incorrect
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Incorrecto',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    backgroundColor: Colors.orange,
                                  ),
                                );

                                setState(() {
                                  _inputText = "";
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                            ),
                            child: const Text('RESPONDER'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //method for paint the questions about the input of response
  _questionWidget() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),

      //load questions of the list questionsList
      //escribir un recudro para el numero y otro para la pregunta

      child: Column(
        children: [
          Text(
            '${questionsList[indexQuestion].idQuestion}.' +
                ' ' +
                '${questionsList[indexQuestion].questionText}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  //method for paint the buttons of the crossword with the numbers corresponding to the questions
  _button(index, number) {
    return TextButton(
      //no cambiar el color del boton cuando se presiona

      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        backgroundColor: index == 1 ||
                index == 30 ||
                index == 174 ||
                index == 195 ||
                index == 238 ||
                index == 249
            ? MaterialStateProperty.all(Colors.transparent)
            : MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: () {
        setState(() {
          indexQuestion = int.parse(number);
          _questionWidget();
        });
      },
      child: Text(
        index == 1 ||
                index == 30 ||
                index == 174 ||
                index == 195 ||
                index == 238 ||
                index == 249
            ? number
            : "",
        style: const TextStyle(
          color: colorNumber,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  //method for paint the letters or numbers of the crossword
  _paintCrossWord(index) {
    return Center(
      //paint the numbers of letters in the boxes corresponding
      child: index == 28
          ? _helpButton()
          : index == 1
              ? _button(index, "1")
              : index == 0
                  ? _button(index, "1")
                  : index == 2
                      ? _button(index, "1")
                      : index == 30
                          ? _button(index, "2")
                          : index == 15
                              ? _button(index, "2")
                              : index == 45
                                  ? _button(index, "2")
                                  : index == 174
                                      ? _button(index, "3")
                                      : index == 173
                                          ? _button(index, "3")
                                          : index == 175
                                              ? _button(index, "3")
                                              : index == 188
                                                  ? _button(index, "3")
                                                  : index == 189
                                                      ? _button(index, "3")
                                                      : index == 190
                                                          ? _button(index, "3")
                                                          : index == 195
                                                              ? _button(
                                                                  index, "4")
                                                              : index == 180
                                                                  ? _button(
                                                                      index,
                                                                      "4")
                                                                  : index == 210
                                                                      ? _button(
                                                                          index,
                                                                          "4")
                                                                      : index ==
                                                                              238
                                                                          ? _button(
                                                                              index,
                                                                              "5")
                                                                          : index == 237
                                                                              ? _button(index, "5")
                                                                              : index == 239
                                                                                  ? _button(index, "5")
                                                                                  : index == 252
                                                                                      ? _button(index, "5")
                                                                                      : index == 253
                                                                                          ? _button(index, "5")
                                                                                          : index == 254
                                                                                              ? _button(index, "5")
                                                                                              : index == 249
                                                                                                  ? _button(index, "6")
                                                                                                  : index == 234
                                                                                                      ? _button(index, "6")
                                                                                                      : index == 235
                                                                                                          ? _button(index, "6")
                                                                                                          : index == 250
                                                                                                              ? _button(index, "6")
                                                                                                              : index == 31
                                                                                                                  ? _setWord(index, "C")
                                                                                                                  : index == 39
                                                                                                                      ? _setWord(index, "A")
                                                                                                                      : index == 196
                                                                                                                          ? _setWord(index, "T")
                                                                                                                          : index == 208
                                                                                                                              ? _setWord(index, "A")
                                                                                                                              : index == 241
                                                                                                                                  ? _setWord(index, "A")
                                                                                                                                  : index >= 16 && index <= 250 && (index - 16) % 15 == 0
                                                                                                                                      ? _setWord(index, words[1])
                                                                                                                                      : index >= 31 && index <= 39
                                                                                                                                          ? _setWord(index, words[2])
                                                                                                                                          : index >= 24 && index <= 159 && (index - 9) % 15 == 0
                                                                                                                                              ? _setWord(index, words[3])
                                                                                                                                              : index >= 196 && index <= 208
                                                                                                                                                  ? _setWord(index, words[4])
                                                                                                                                                  : index >= 193 && index <= 223 && (index - 193) % 15 == 0
                                                                                                                                                      ? _setWord(index, words[5])
                                                                                                                                                      : index >= 240 && index <= 248
                                                                                                                                                          ? _setWord(index, words[6])
                                                                                                                                                          : const Text(
                                                                                                                                                              "",
                                                                                                                                                              style: TextStyle(
                                                                                                                                                                color: Colors.white,
                                                                                                                                                                fontSize: 20,
                                                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                                              ),
                                                                                                                                                            ),
    );
  }

  //method for paint the letters if the answer is correct and index is the indicated
  _setWord(index, word) {
    if (word == words[1]) {
      if (words[1] != null) {
        return Text(
          index >= 16 && index <= 250 && (index - 16) % 15 == 0
              ? word[(index - 16) ~/ 15]
              : "",
          style: const TextStyle(
            color: colorLetter,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      } else {
        return const Text(
          "",
          style: TextStyle(
            color: colorLetter,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      }
    }

    if (word == words[2]) {
      if (words[2] != null) {
        return Text(
          word[index - 31],
          style: const TextStyle(
            color: colorLetter,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      } else {
        return const Text(
          "",
          style: TextStyle(
            color: colorLetter,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      }
    }

    if (word == words[3]) {
      if (words[3] != null) {
        return Text(
          //insertar la palabra "integridad" al reves desde la posicion 9 hasta la 6
          index >= 24 && index <= 159 && (24 - index) % 15 == 0
              ? word[(159 - index) ~/ 15]
              : "",

          style: const TextStyle(
            color: colorLetter,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      } else {
        return const Text(
          "",
          style: TextStyle(
            color: colorLetter,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      }
    }

    if (word == words[4]) {
      if (words[4] != null) {
        return Text(
          //insertar la palabra "integridad" al reves desde la posicion 9 hasta la 6
          index >= 196 && index <= 208 ? word[index - 196] : "",

          style: const TextStyle(
            color: colorLetter,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      } else {
        return const Text(
          "",
          style: TextStyle(
            color: colorLetter,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      }
    }

    if (word == words[5]) {
      if (words[5] != null) {
        return Text(
          //insertar la palabra "integridad" al reves desde la posicion 9 hasta la 6
          index >= 193 && index <= 223 && (193 - index) % 15 == 0
              ? word[(223 - index) ~/ 15]
              : "",

          style: const TextStyle(
            color: colorLetter,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      } else {
        return const Text(
          "",
          style: TextStyle(
            color: colorLetter,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      }
    }

    if (word == words[6]) {
      if (words[6] != null) {
        return Text(
          //insertar la palabra "integridad" al reves desde la posicion 9 hasta la 6
          index >= 240 && index <= 248 ? word[(248 - index)] : "",

          style: const TextStyle(
            color: colorLetter,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      } else {
        return const Text(
          "",
          style: TextStyle(
            color: colorLetter,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      }
    }

    if (word == "C" && (words[1] != null || words[2] != null) && index == 31) {
      return Text(
        word,
        style: const TextStyle(
          color: colorLetter,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    if (word == "A" && (words[2] != null || words[3] != null) && index == 39) {
      return Text(
        word,
        style: const TextStyle(
          color: colorLetter,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    if (word == "T" && (words[1] != null || words[4] != null) && index == 196) {
      return Text(
        word,
        style: const TextStyle(
          color: colorLetter,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    if (word == "A" && (words[4] != null || words[5] != null) && index == 208) {
      return Text(
        word,
        style: const TextStyle(
          color: colorLetter,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    if (word == "A" && (words[1] != null || words[6] != null) && index == 241) {
      return Text(
        word,
        style: const TextStyle(
          color: colorLetter,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  //metodo para crear un boton de ayuda para el usuario, cuando se presiona el boton se muestra imagen de ayuda
  Widget _helpButton() {
    return TextButton(
      autofocus: true,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(40, 150, 40, 1)),
        //convertir el boton en un circulo

        shape: MaterialStateProperty.all(const CircleBorder()),
        //color al borde
        side: MaterialStateProperty.all(
            const BorderSide(color: Colors.black, width: 0.2)),
        shadowColor: MaterialStateProperty.all(Colors.black),
        overlayColor: MaterialStateProperty.all(Colors.white),
        minimumSize: MaterialStateProperty.all(const Size(30, 30)),
      ),
      onPressed: () {
        setState(() {
          //mostrar un showDialog de ayuda con un boton para cerrar el dialog
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  //hacer que el dialog tenga un overflow para que se pueda ver la imagen completa
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Text(
                          "Para empezar a resolver el crucigrama debes oprimir el número correspondiente a la línea de la palabra que deseas resolver, como se muestra a continuación:",
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.justify,
                        ),
                        Image(
                          image: AssetImage(
                              "assets/activities/crucigrama/help1.png"),
                          height: 150,
                          width: 150,
                        ),
                        Text(
                          "Una vez oprimas en alguno de los números del crucigrama, en la parte inferior se revelará la pregunta clave para resolver la palabra, debes escribir la respuesta en el recuadro que se te muestra a continuación:",
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.justify,
                        ),
                        Image(
                          image: AssetImage(
                              "assets/activities/crucigrama/help2.png"),
                          height: 150,
                          width: 300,
                        ),
                        Text(
                          'Una vez escribas la palabra oprime en el botón "RESPONDER" para validar tu respuesta. Se te mostrará un mensaje informándote si tu respuesta fue correcta o no. Puedes oprimir en cualquier número para cambiar de pregunta.',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.justify,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text(
                            "¡Buena Suerte!'",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),

                  title: const Text("¿Como se juega?"),
                  //escribir un parrafo para describir la mecanica del juego
                  contentPadding: const EdgeInsets.all(10),

                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Cerrar",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              });
        });
      },
      child: const Text(
        "?",
        style: TextStyle(
          fontSize: 16,
          //grososr 600
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
