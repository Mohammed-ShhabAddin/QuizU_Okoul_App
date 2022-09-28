// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:quizu_okuoul_app/core/api/api_consumer.dart';
import 'package:quizu_okuoul_app/core/api/end_points.dart';
import 'package:quizu_okuoul_app/features/quiz/data/models/question_model.dart';

abstract class QuestionsRemoteDataSource {
  Future<List<QuestionModel>> getQuestion();
}

class QuestionsRemoteDataSourceImpl implements QuestionsRemoteDataSource {
  ApiConsumer apiConsumer;

  QuestionsRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<List<QuestionModel>> getQuestion() async {
    final List response = await apiConsumer.get(
      EndPoints.questions,
    );

    final List<QuestionModel> questionModels = response
        .map((jsonQModel) => QuestionModel.formJson(jsonQModel))
        .toList();

    return questionModels;
  }
}
