import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entity/token_entity.dart';
import '../../domain/use_case/token_uc.dart';
part 'token_state.dart';

class TokenCubit extends Cubit<TokenState> {
  TokenCubit({
    required this.tokenVerificationUsecase,
  }) : super(TokenInitial());

  final TokenVerificationUsecase tokenVerificationUsecase;

  Future<void> verifyTokenStatus() async {
    TokenVerification response = await tokenVerificationUsecase.call();

    emit(TokenLoaded(tokenVerification: response));
    // .fold(
    //     (failure) => TokenError(msg: _mapFailureToMsg(failure)),
    //     (tokenVerify) => TokenLoaded(tokenVerification: tokenVerify));

    //   emit(response.fold((failure) => TokenError(msg: _mapFailureToMsg(failure)),
    //       (tokenVerify) => TokenLoaded(tokenVerification: tokenVerify)));
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
