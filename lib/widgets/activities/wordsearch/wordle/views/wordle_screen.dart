import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flip_card/flip_card.dart';
import 'package:pruebaflutter1/widgets/activities/wordsearch/wordle/data/word_list.dart';
import 'package:pruebaflutter1/widgets/activities/wordsearch/wordle/models/letter_model.dart';
import 'package:pruebaflutter1/widgets/activities/wordsearch/wordle/models/word_model.dart';
import 'package:pruebaflutter1/widgets/activities/wordsearch/wordle/widgets/board.dart';
import 'package:pruebaflutter1/widgets/activities/wordsearch/wordle/widgets/keyboard.dart';

String? randomWord =
    fiveLetterWords.keys.elementAt(Random().nextInt(fiveLetterWords.length));
Word _solution = Word.fromStrin(randomWord!);

enum GameStatus { playing, submitting, lost, won }

class WordleScreen extends StatefulWidget {
  const WordleScreen({Key? key}) : super(key: key);

  @override
  State<WordleScreen> createState() => _WordleScreenState();
}

class _WordleScreenState extends State<WordleScreen> {
  GameStatus _gameStatus = GameStatus.playing;

  final List<Word> _board = List.generate(
      6,
      (_) => Word(
          letters: List.generate(
              _solution.wordString.length, (_) => Letter.empty())));

  final List<List<GlobalKey<FlipCardState>>> _flipCardKeys = List.generate(
      6,
      (_) => List.generate(
          _solution.wordString.length, (_) => GlobalKey<FlipCardState>()));

  int _currentWordIndex = 0;

  Word? get _currentWord =>
      _currentWordIndex < _board.length ? _board[_currentWordIndex] : null;

  final Set<Letter> _keyboardLetters = {};

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      child: Column(
        //forzar que el contenido ocupe todo el espacio disponible
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //alinear a la izquierda
            alignment: Alignment.centerRight,

            //forzar que el contenido este en lado izquierdo de la pantalla
            padding: const EdgeInsets.only(right: 20, top: 20),

            child: TextButton(
              //tamaño del boton

              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(40, 150, 40, 1)),
                //convertir el boton en un circulo

                shape: MaterialStateProperty.all(const CircleBorder()),
                //color al borde
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.black, width: 2)),
                shadowColor: MaterialStateProperty.all(Colors.black),
                overlayColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(const Size(30, 30)),
              ),
              onPressed: () {
                //mostrar un showDialog de ayuda con un boton para cerrar el dialog
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        //hacer que el dialog tenga un overflow para que se pueda ver la imagen completa
                        content: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Para empezar a resolver el "Word Search" debes intentar resolver la palabra con ayuda de la pista de la parte superior.',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Utiliza el teclado de la pantalla para digitar la posible palabra y ten en cuenta que solo tienes 6 oportunidades para ello, sin embargo a medida que completes una oportunidad se te darán pistas para ayudarte a encontrar la palabra objetivo.",
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 15, left: 8, right: 8),
                                  child: Text(
                                    "Pista 1",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0, left: 8, right: 8),
                                  child: Text(
                                    "Si la letra se torna de color verde quiere decir que vas por buen camino, la letra se encuentra en la palabra objetivo y está en la posición correcta.",
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/activities/wordsearch/c.png"),
                                    height: 110,
                                    width: 300,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 15, left: 8, right: 8),
                                  child: Text(
                                    "Pista 2",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0, left: 8, right: 8),
                                  child: Text(
                                    "Si la letra se torna de color amarillo no estás mal, solo que la letra si se encuentra en la palabra objetivo pero no en la posición correcta.",
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/activities/wordsearch/t.png"),
                                    height: 110,
                                    width: 300,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 15, left: 8, right: 8),
                                  child: Text(
                                    "Pista 3",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0, left: 8, right: 8),
                                  child: Text(
                                    "Por último, pero menos importante si la letra se torna naranja quiere decir que dicha letra no se encuentra en la palabra por lo tanto puedes descartarla en la siguiente oportunidad.",
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/activities/wordsearch/l.png"),
                                    height: 110,
                                    width: 300,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "¡Buena Suerte!'",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
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
                            child: const Text("Cerrar",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                          ),
                        ],
                      );
                    });
              },
              child: const Text(
                "?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 5, left: 28, right: 28, bottom: 20),
            child: Center(
              child: Text(
                fiveLetterWords.isEmpty
                    ? "Gracias por jugar"
                    : fiveLetterWords[_solution.wordString]!.toUpperCase(),
                style: const TextStyle(
                  fontSize: 22,
                  //grososr 600
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            //margen entre el texto y el tablero
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black.withOpacity(0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Board(
                  board: _board,
                  flipCardKeys: _flipCardKeys,
                  word: _solution,
                ),
              ),
            ),
          ),
          //crear un boton de ayuda para mostrar un showdialog

          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 30, top: 20),
            child: Keyboard(
                onKeyTapped: _onKeyTapped,
                onDeleteTapped: _onDeleteTapped,
                onEnterTapped: _onEnterTapped,
                letters: _keyboardLetters),
          ),
        ],
      ),
    );
  }

  void _onKeyTapped(String val) {
    if (_gameStatus == GameStatus.playing) {
      setState(() => _currentWord?.addLetter(val));
    }
  }

  void _onDeleteTapped() {
    if (_gameStatus == GameStatus.playing) {
      setState(() => _currentWord?.removeLetter());
    }
  }

  Future<void> _onEnterTapped() async {
    if (_gameStatus == GameStatus.playing &&
        _currentWord != null &&
        !_currentWord!.letters.contains(Letter.empty())) {
      _gameStatus = GameStatus.submitting;

      for (var i = 0; i < _currentWord!.letters.length; i++) {
        final currentWordLetter = _currentWord!.letters[i];
        final currentSolutionLetter = _solution.letters[i];

        setState(() {
          if (currentWordLetter == currentSolutionLetter) {
            _currentWord!.letters[i] =
                currentWordLetter.copyWith(status: LetterStatus.correct);
          } else if (_solution.letters.contains(currentWordLetter)) {
            _currentWord!.letters[i] =
                currentWordLetter.copyWith(status: LetterStatus.inWord);
          } else {
            _currentWord!.letters[i] =
                currentWordLetter.copyWith(status: LetterStatus.notInWord);
          }
        });

        final letter = _keyboardLetters.firstWhere(
          (e) => e.val == currentWordLetter.val,
          orElse: () => Letter.empty(),
        );

        if (letter.status != LetterStatus.correct) {
          _keyboardLetters.removeWhere((e) => e.val == currentWordLetter.val);
          _keyboardLetters.add(_currentWord!.letters[i]);
        }

        await Future.delayed(
          const Duration(milliseconds: 150),
          () => _flipCardKeys[_currentWordIndex][i].currentState?.toggleCard(),
        );
      }

      _checkIfWinOrLoss();
    }
  }

  void _checkIfWinOrLoss() {
    if (_currentWord!.wordString == _solution.wordString) {
      _gameStatus = GameStatus.won;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.none,
          duration: const Duration(days: 1),
          backgroundColor: const Color.fromRGBO(40, 150, 40, 1),
          content: const Text(
            '¡Acertaste!',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          action: SnackBarAction(
            onPressed: _restart,
            textColor: Colors.white,
            label: 'siguiente',
          ),
        ),
      );

      fiveLetterWords.remove(randomWord);
    } else if (_currentWordIndex + 1 >= _board.length) {
      _gameStatus = GameStatus.lost;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.none,
          duration: const Duration(days: 1),
          backgroundColor: const Color.fromRGBO(225, 128, 10, 1),
          content: Text(
            'Perdiste! Solución: ${_solution.wordString}',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          action: SnackBarAction(
            onPressed: _restart,
            textColor: Colors.black,
            label: 'Nuevo Juego',
          ),
        ),
      );
    } else {
      _gameStatus = GameStatus.playing;
      _currentWordIndex++;
    }
  }

  void _restart() {
    //validar si fiveLetterWords esta vacio para mostrar un dialogo de fin de juego
    if (fiveLetterWords.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Fin del juego"),
              content: const Text("Felicitaciones, has completado el juego"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cerrar",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                ),
              ],
            );
          });
    } else {
      setState(() {
        _gameStatus = GameStatus.playing;
        _currentWordIndex = 0;
        randomWord = fiveLetterWords.keys
            .elementAt(Random().nextInt(fiveLetterWords.length));
        _solution = Word.fromStrin(randomWord!);

        _board
          ..clear()
          ..addAll(List.generate(
              6,
              (_) => Word(
                  letters: List.generate(
                      _solution.wordString.length, (_) => Letter.empty()))));

        _flipCardKeys
          ..clear()
          ..addAll(
            List.generate(
              6,
              (_) => List.generate(_solution.wordString.length,
                  (_) => GlobalKey<FlipCardState>()),
            ),
          );
        _keyboardLetters.clear();
      });
    }
  }
}
