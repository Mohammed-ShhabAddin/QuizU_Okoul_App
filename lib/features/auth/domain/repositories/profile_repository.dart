import 'package:dartz/dartz.dart';
import '../entities/profile.dart';

import '../../../../core/error/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileInfo>> getUserProfileInfo();
}
