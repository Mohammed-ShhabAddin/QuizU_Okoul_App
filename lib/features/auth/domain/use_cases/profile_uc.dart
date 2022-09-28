import 'package:dartz/dartz.dart';
import '../entities/profile.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/profile_repository.dart';

class ProfileUescase implements UseCase<ProfileInfo, NoParams> {
  final ProfileRepository profileRepository;
  ProfileUescase({required this.profileRepository});

  @override
  Future<Either<Failure, ProfileInfo>> call(NoParams params) async {
    return await profileRepository.getUserProfileInfo();
  }
}
