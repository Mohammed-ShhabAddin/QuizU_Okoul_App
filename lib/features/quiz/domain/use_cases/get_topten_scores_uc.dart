import 'package:dartz/dartz.dart';
import '../entites/topten_scores.dart';
import '../repositories/topten_scores_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetToptenScoresusecase implements UseCase<TopTenScores, NoParams> {
  final ToptenScoresRepository toptenScoresRepository;

  GetToptenScoresusecase({required this.toptenScoresRepository});

  @override
  Future<Either<Failure, List<TopTenScores>>> call(NoParams params) {
    return toptenScoresRepository.getTopTenScores();
  }
}
