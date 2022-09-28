// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'token_cubit.dart';

abstract class TokenState extends Equatable {
  const TokenState();

  @override
  List<Object> get props => [];
}

class TokenInitial extends TokenState {}

class TokenLoading extends TokenState {}

class TokenLoaded extends TokenState {
  final TokenVerification tokenVerification;
  const TokenLoaded({
    required this.tokenVerification,
  });
  @override
  List<Object> get props => [tokenVerification];
}

class TokenError extends TokenState {
  final String msg;
  const TokenError({required this.msg});
  @override
  List<Object> get props => [msg];
}
