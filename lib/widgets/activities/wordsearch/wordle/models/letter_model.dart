import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pruebaflutter1/widgets/activities/wordsearch/app/app_colors.dart';


enum LetterStatus { initial, notInWord, inWord, correct }

class Letter extends Equatable{
  const Letter({
    required this.val,
    this.status = LetterStatus.initial,

  });

  factory Letter.empty() => const Letter(val: '');

  final String val;

  final LetterStatus status;


  //metodo para generar el color de la caja de la letra
  Color get backgroundColor {
    switch (status) {
      case LetterStatus.initial:
        return const Color.fromRGBO(225, 138, 10, 1);
      case LetterStatus.notInWord:
        return notInWordColor;
      case LetterStatus.inWord:
        return inWordColor;
      case LetterStatus.correct:
        return correctColor;
    }
  }


  // Metodo para generar el color del borde segun el estado de la letra
  Color get borderColor {
    switch (status) {
      case LetterStatus.initial:
        return Colors.black87;
      default:
        return Colors.black87;
    }
  }

  double get borderSize {
    switch (status) {
      case LetterStatus.initial:
        return 0.5;
      default:
        return 1.3;
    }
  }


  // Metodo para copiar el estado de la letra
  Letter copyWith({
    String? val,
    LetterStatus? status,
  }) {
    return Letter(
      val: val ?? this.val,
      status: status ?? this.status,
    );
  }


  @override
  //crea una lista de objetos que se usan para comparar
  List<Object?> get props => [val, status];

}