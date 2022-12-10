


import 'package:equatable/equatable.dart';

import '../../../../domain/models/puzzle.dart';


enum GameStatus {
  created,
  playing,
  solved,
}


//State of the game
class GameState extends Equatable{
  final int crossAxisCount;
  final Puzzle puzzle;
  final bool solved;
  //number of moves
  final int moves;
  final GameStatus status;

  //constructor
  const GameState({
    required this.crossAxisCount,
    required this.puzzle,
    required this.solved,
    required this.moves,
    required this.status,
  });


  //copy the state of the game with the new values
  GameState copyWith({
    int? crossAxisCount,
    int? moves,
    Puzzle? puzzle,
    bool? solved,
    GameStatus? status,
  }) {
    return GameState(

      //if the value is null, return the old value
      status: status ?? this.status,
      moves: moves ?? this.moves,
      crossAxisCount: crossAxisCount ?? this.crossAxisCount,
      puzzle: puzzle ?? this.puzzle,
      solved: solved ?? this.solved,
    );
  }

  @override

  //return a list of game states with our crossAxisCount, puzzle, solved, moves and status
  List<Object?> get props => [
        moves,
        crossAxisCount,
        puzzle,
        solved,
        status,
      ];
}
