import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final String otp; //always four zeros
  final String mobile;

  const Login({required this.otp, required this.mobile});

  @override
  List<Object?> get props => [otp, mobile];
}

class LoginResponse extends Equatable {
  final bool success; //not important
  final String? msg; //not important
  final String token; //intersted
  final String? name; // might be Null
  final String? mobile;

  const LoginResponse(
      {required this.success,
      required this.msg,
      required this.token,
      required this.name,
      required this.mobile});

  @override
  List<Object?> get props => [success, msg, token, name, mobile];
}
