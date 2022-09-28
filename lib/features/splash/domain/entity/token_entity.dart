import 'package:equatable/equatable.dart';

class TokenVerification extends Equatable {
  final bool success;
  final String message;

  const TokenVerification({
    required this.success,
    required this.message,
  });

  @override
  List<Object?> get props => [success, message];
}
