import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/token_entity.dart';

abstract class TokenRepository {
  Future<TokenVerification> verifyTokenStatus();
}
