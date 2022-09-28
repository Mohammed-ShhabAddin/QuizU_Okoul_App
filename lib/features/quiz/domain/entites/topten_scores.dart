import 'dart:ffi';

import 'package:equatable/equatable.dart';

class TopTenScores extends Equatable {
  //name must be UserScore maybe
  final String name;
  final int score;

  const TopTenScores({
    required this.name,
    required this.score,
  });

  @override
  List<Object?> get props => [name, score];
}
