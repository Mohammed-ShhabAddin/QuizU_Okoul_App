import '../../domain/entity/token_entity.dart';

import '../../../../core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repository/token_repository.dart';
import '../data_source/token_remote_datasource.dart';

class TokenRepoImpl implements TokenRepository {
  final NetworkInfo networkInfo;

  final TokenRemoteDataSource tokenRemoteDataSource;

  TokenRepoImpl({
    required this.networkInfo,
    required this.tokenRemoteDataSource,
  });

  @override
  Future<TokenVerification> verifyTokenStatus() async {
    if (await networkInfo.isConnected) {
      try {
        final tokenStatus = await tokenRemoteDataSource.verifyTokenStatus();
        return tokenStatus;
      } on ServerException {
        return const TokenVerification(
          message: '',
          success: false,
        );
      }
    } else {
      return const TokenVerification(
        message: 'try again',
        success: false,
      );
    }
  }
}
