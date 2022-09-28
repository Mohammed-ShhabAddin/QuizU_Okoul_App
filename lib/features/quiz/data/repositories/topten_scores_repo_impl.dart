import '../../domain/entites/topten_scores.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/topten_scores_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../data_source/top_ten_remote_datasource.dart';

class TopTenScoresRepoImpl implements ToptenScoresRepository {
  final NetworkInfo networkInfo;

  final TopTenRemoteDataSource toptenRemoteDataSource;

  TopTenScoresRepoImpl({
    required this.networkInfo,
    required this.toptenRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<TopTenScores>>> getTopTenScores() async {
    if (await networkInfo.isConnected) {
      try {
        final toptenScores = await toptenRemoteDataSource.getTopTenScores();
        return Right(toptenScores);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
