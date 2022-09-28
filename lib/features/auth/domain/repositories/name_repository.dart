import 'package:dartz/dartz.dart';
import '../entities/name.dart';

import '../../../../core/error/failures.dart';

abstract class NameRepository {
  Future<Either<Failure, NameResponse>> uploadUsername(String name);
}
