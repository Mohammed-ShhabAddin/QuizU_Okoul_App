import 'package:dartz/dartz.dart';
import '../entites/topten_scores.dart';

import '../../../../core/error/failures.dart';

abstract class ToptenScoresRepository {
  Future<Either<Failure, List<TopTenScores>>> getTopTenScores();
}
