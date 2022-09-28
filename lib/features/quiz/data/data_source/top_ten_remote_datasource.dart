// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:quizu_okuoul_app/core/api/api_consumer.dart';
import 'package:quizu_okuoul_app/core/api/end_points.dart';
import '../models/top_ten_model.dart';

abstract class TopTenRemoteDataSource {
  Future<List<TopTenScoresModel>> getTopTenScores();
}

class TopTenRemoteDataSourceImpl implements TopTenRemoteDataSource {
  ApiConsumer apiConsumer;

  TopTenRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<List<TopTenScoresModel>> getTopTenScores() async {
    final List response = await apiConsumer.get(EndPoints.topScores);
    final List<TopTenScoresModel> topTenScores = response
        .map((jsonModel) => TopTenScoresModel.fromjson(jsonModel))
        .toList();

    return topTenScores;
  }
}
