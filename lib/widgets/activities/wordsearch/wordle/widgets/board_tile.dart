import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/activities/wordsearch/wordle/models/letter_model.dart';
import 'package:pruebaflutter1/widgets/activities/wordsearch/wordle/models/word_model.dart';




class BoardTile extends StatelessWidget {
  const BoardTile({Key? key, required this.letter,required this.word,required this.wordComplete,}) : super(key: key);


  final Letter letter;
  final Word word;
  final String wordComplete;


  @override

  Widget build(BuildContext context) {

    return Container(


      constraints:const BoxConstraints(
        maxHeight: 40,
      ),

      margin: const EdgeInsets.all(1.5),
      height:wordComplete == "COOPERATIVO" ? 30
          :wordComplete == "MARFILES" ? 35
          :wordComplete == "PESEM" ? 38
          :wordComplete == "CUATRO" ? 36
          : 30,
      width:wordComplete == "COOPERATIVO" ? 30
          : wordComplete == "MARFILES" ? 35
          :wordComplete == "PESEM" ? 38
          :wordComplete == "CUATRO" ? 36
          :30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: letter.backgroundColor,
        border: Border.all(color: letter.borderColor,width: letter.borderSize,),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        letter.val,
        style:  TextStyle(
          fontSize:wordComplete == "MARFILES" || wordComplete == "COOPERATIVO" ? 25:30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}
