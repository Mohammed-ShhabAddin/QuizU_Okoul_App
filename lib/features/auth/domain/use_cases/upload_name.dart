import 'package:dartz/dartz.dart';
import '../repositories/name_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/name.dart';

class NameUsecase implements UseCase<NameResponse, String> {
  final NameRepository nameRepository;
  NameUsecase({required this.nameRepository});

  @override
  Future<Either<Failure, NameResponse>> call(String name) async {
    return await nameRepository.uploadUsername(name);
  }
}
