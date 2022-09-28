import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String question;
  final String a;
  final String b;
  final String c;
  final String d;
  final String correct; //conceder making it class

  const Question(
      {required this.question,
      required this.a,
      required this.b,
      required this.c,
      required this.d,
      required this.correct});

  @override
  List<Object?> get props => [question, a, b, c, d, correct];
}
