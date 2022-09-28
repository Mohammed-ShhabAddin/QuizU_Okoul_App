import '../../domain/entites/topten_scores.dart';

class TopTenScoresModel extends TopTenScores {
  const TopTenScoresModel({
    required super.name,
    required super.score,
  });

  factory TopTenScoresModel.fromjson(Map<String, dynamic> json) {
    return TopTenScoresModel(name: json["name"], score: json["score"]);
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "score": score,
      };
}
