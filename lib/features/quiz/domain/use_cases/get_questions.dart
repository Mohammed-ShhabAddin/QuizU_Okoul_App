import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecase.dart';
import '../entites/question.dart';
import '../repositories/questions_repository.dart';

class GetQuestionsusecase implements UseCase<Question, NoParams> {
  final QuestionsRepository questionsRepository;
  GetQuestionsusecase({required this.questionsRepository});

  @override
  Future<Either<Failure, List<Question>>> call(NoParams params) {
    return questionsRepository.getQuestions();
  }
}
