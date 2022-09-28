import 'package:dartz/dartz.dart';
import '../entities/login.dart';

import '../../../../core/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponse>> askForLogin(
      Login login); //change to appropriate name maybe
}
