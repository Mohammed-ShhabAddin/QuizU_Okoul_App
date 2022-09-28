import 'package:dartz/dartz.dart';
import '../entites/question.dart';

import '../../../../core/error/failures.dart';

abstract class QuestionsRepository {
  Future<Either<Failure, List<Question>>> getQuestions();
}
