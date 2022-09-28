// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

// لابد من وجود حالات اخرى
class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  LoginResponse loginResponse;
  AuthLoaded({
    required this.loginResponse,
  });
  @override
  List<Object> get props => [loginResponse];
}

class AuthError extends AuthState {
  final String msg;
  const AuthError({required this.msg});
  @override
  List<Object> get props => [msg];
}

class ProfileLoaded extends AuthState {
  final ProfileInfo profileInfo;

  const ProfileLoaded({required this.profileInfo});
  @override
  List<Object> get props => [profileInfo];
}

class ProfileLoading extends AuthState {}

class ProfileError extends AuthState {
  final String msg;
  const ProfileError({required this.msg});
  @override
  List<Object> get props => [msg];
}

class NameResponseError extends AuthState {
  final String msg;
  const NameResponseError({required this.msg});
  @override
  List<Object> get props => [msg];
}

class NameResponseLoaded extends AuthState {
  final NameResponse nameResponse;

  const NameResponseLoaded({required this.nameResponse});
  @override
  List<Object> get props => [nameResponse];
}
