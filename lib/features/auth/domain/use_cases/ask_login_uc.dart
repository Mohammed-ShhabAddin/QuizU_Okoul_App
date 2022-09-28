import 'package:dartz/dartz.dart';
import '../entities/login.dart';
import '../repositories/login_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class LoginUescase implements UseCase<LoginResponse, Login> {
  final LoginRepository loginRepository;
  LoginUescase({required this.loginRepository});

  @override
  Future<Either<Failure, LoginResponse>> call(Login login) async {
    return await loginRepository.askForLogin(login);
  }
}
