import 'package:equatable/equatable.dart';
import 'package:pruebaflutter1/widgets/activities/puzzle/domain/models/position.dart';


class Tile extends Equatable {
  final int value;
  final Position position; //save the position of the tile even if it is correct
  final Position correctPosition; //save the correct position of the tile

  //constructor
  const Tile({
    required this.value,
    required this.position,
    required this.correctPosition,
  });


  //return a copy of the tile with the new position
  Tile move(Position newPosition) {
    return Tile(
      value: value,
      correctPosition: correctPosition,
      position: newPosition,
    );
  }

  @override
  //return a list of tiles with our position, value and correct position
  List<Object?> get props => [
        position,
        correctPosition,
        value,
      ];
}
