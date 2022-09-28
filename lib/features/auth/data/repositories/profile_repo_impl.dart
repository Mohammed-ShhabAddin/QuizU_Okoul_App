import 'package:flutter/gestures.dart';
import '../data_sources/profile_remote_datasource.dart';
import '../../domain/entities/profile.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/profile_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';

class ProfileRepoImpl implements ProfileRepository {
  final NetworkInfo networkInfo;
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepoImpl({
    required this.profileRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ProfileInfo>> getUserProfileInfo() async {
    if (await networkInfo.isConnected) {
      print(" msamsamsamsma ${networkInfo.isConnected}");
      try {
        final profileinfo = await profileRemoteDataSource.getUserProfileInfo();

        return Right(profileinfo);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(OfflineFaliure());
  }
}
