import 'package:dartz/dartz.dart';
import '../entity/token_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/token_repository.dart';

class TokenVerificationUsecase {
  final TokenRepository tokenRepository;

  TokenVerificationUsecase({required this.tokenRepository});

  Future<TokenVerification> call() {
    return tokenRepository.verifyTokenStatus();
  }
}
