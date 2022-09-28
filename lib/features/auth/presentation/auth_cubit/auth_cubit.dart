import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/login.dart';
import '../../domain/entities/name.dart';
import '../../domain/entities/profile.dart';
import '../../domain/use_cases/ask_login_uc.dart';
import '../../domain/use_cases/upload_name.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/use_cases/profile_uc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUescase loginUescase;
  final ProfileUescase profileUescase;
  final NameUsecase nameUsecase;
  AuthCubit(
      {required this.nameUsecase,
      required this.profileUescase,
      required this.loginUescase})
      : super(AuthInitial());

  Future<void> askForLogin(Login login) async {
    Either<Failure, LoginResponse> response = await loginUescase.call(login);

    emit(response.fold((failure) => AuthError(msg: _mapFailureToMsg(failure)),
        (loginres) => AuthLoaded(loginResponse: loginres)));
  }

  Future getProfileInfo() async {
    Either<Failure, ProfileInfo> response =
        await profileUescase.call(NoParams());

    emit(response.fold(
        (failure) => ProfileError(msg: _mapFailureToMsg(failure)),
        (profileinfo) => ProfileLoaded(profileInfo: profileinfo)));
  }

  Future uploadeUserName(String name) async {
    Either<Failure, NameResponse> response = await nameUsecase.call(name);

    emit(response.fold(
        (failure) => NameResponseError(msg: _mapFailureToMsg(failure)),
        (nameResponse) => NameResponseLoaded(nameResponse: nameResponse)));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
