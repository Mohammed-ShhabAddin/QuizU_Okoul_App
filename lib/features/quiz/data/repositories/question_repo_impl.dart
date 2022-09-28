// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:quizu_okuoul_app/core/error/failures.dart';
import 'package:quizu_okuoul_app/core/network/network_info.dart';
import 'package:quizu_okuoul_app/features/quiz/data/data_source/questions_remote_datasource.dart';
import 'package:quizu_okuoul_app/features/quiz/domain/entites/question.dart';
import 'package:quizu_okuoul_app/features/quiz/domain/repositories/questions_repository.dart';

import '../../../../core/error/exceptions.dart';

class QuestionRepoImpl implements QuestionsRepository {
  final NetworkInfo networkInfo;
  final QuestionsRemoteDataSource questionsRemoteDataSource;

  QuestionRepoImpl({
    required this.networkInfo,
    required this.questionsRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<Question>>> getQuestions() async {
    if (await networkInfo.isConnected) {
      try {
        final questions = await questionsRemoteDataSource.getQuestion();
        return Right(questions);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
