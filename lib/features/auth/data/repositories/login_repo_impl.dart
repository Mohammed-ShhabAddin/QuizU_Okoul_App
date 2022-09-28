import '../../domain/entities/login.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/login_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../data_sources/login_local_datasource.dart';
import '../data_sources/login_remote_datasource.dart';

class LoginRepoImpl implements LoginRepository {
  final NetworkInfo networkInfo;

  final LoginRemoteDataSource loginRemoteDataSource;
  final LoginLocalDataSource loginLocalDataSource;

  LoginRepoImpl(
      {required this.loginRemoteDataSource,
      required this.loginLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, LoginResponse>> askForLogin(Login login) async {
    if (await networkInfo.isConnected) {
      try {
        print("at login repository data  layer");

        final remoteLoginResponse =
            await loginRemoteDataSource.askForLogin(login);
        loginLocalDataSource.cachLoginResponse(remoteLoginResponse!);
        return Right(remoteLoginResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheLoginResponse =
            await loginLocalDataSource.getCachedLogingResponse();
        return Right(cacheLoginResponse);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
