import 'package:equatable/equatable.dart';

class Position extends Equatable {
  final int x; // column
  final int y; // row


  //constructor
  const Position({
    required this.x,
    required this.y,
  });

  @override
  //return a list of positions with our x and y for ubicate in the grid
  List<Object?> get props => [x, y];
}
