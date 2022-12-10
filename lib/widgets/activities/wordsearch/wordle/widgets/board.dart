
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/activities/wordsearch/wordle/models/letter_model.dart';
import 'package:pruebaflutter1/widgets/activities/wordsearch/wordle/models/word_model.dart';
import 'package:pruebaflutter1/widgets/activities/wordsearch/wordle/widgets/board_tile.dart';



class Board extends StatelessWidget {
  const Board({
    Key? key,
    required this.board,
    required this.flipCardKeys,
    required this.word,

  }) : super(key: key);


  final List<Word> board;

  final Word word;

  final List<List<GlobalKey<FlipCardState>>> flipCardKeys;

  @override
  Widget build(BuildContext context) {
    String wordComplete = word.wordString;
    return Column(
      children: board
          .asMap()
          .map(
              (i,word) => MapEntry(i,

                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: word.letters
                      .asMap()
                      .map(
                        (j,letter) => MapEntry(
                            j,
                            FlipCard(
                              key: flipCardKeys[i][j],
                              flipOnTouch: false,
                              direction: FlipDirection.VERTICAL,
                              front: BoardTile(
                                letter: Letter(
                                  val: letter.val,
                                  status: LetterStatus.initial,
                                ),
                                word: word,
                                wordComplete: wordComplete,
                              ),
                              back: BoardTile(
                                letter: letter,
                                word: word,
                                wordComplete: wordComplete,
                              ),
                            ),
                        ),
                  )
                      .values
                  .toList(),
              ),
              ),
      )
          .values
          .toList()
          );
  }
}
