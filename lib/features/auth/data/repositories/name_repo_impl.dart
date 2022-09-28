import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../data_sources/name_remote_datasource.dart';
import '../../domain/entities/name.dart';
import '../../domain/repositories/name_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';

class NameRepoImpl implements NameRepository {
  final NetworkInfo networkInfo;
  final NameRemoteDataSource nameRemoteDataSource;

  NameRepoImpl({
    required this.networkInfo,
    required this.nameRemoteDataSource,
  });

  @override
  Future<Either<Failure, NameResponse>> uploadUsername(String name) async {
    if (await networkInfo.isConnected) {
      try {
        final nameResponse = await nameRemoteDataSource.uploadUsername(name);

        return Right(nameResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(OfflineFaliure());
  }
}
