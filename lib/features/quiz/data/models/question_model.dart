import '../../domain/entites/question.dart';

class QuestionModel extends Question {
  const QuestionModel(
      {required super.question,
      required super.a,
      required super.b,
      required super.c,
      required super.d,
      required super.correct});

  factory QuestionModel.formJson(Map<String, dynamic> json) {
    return QuestionModel(
        question: json["Question"],
        a: json["a"],
        b: json["b"],
        c: json["c"],
        d: json["d"],
        correct: json["correct"]);
  }

  Map<String, dynamic> toJson() => {
        "Question": question,
        "a": a,
        "b": b,
        "c": c,
        "d": d,
        "correct": correct
      };
}
