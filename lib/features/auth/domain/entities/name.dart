import 'package:equatable/equatable.dart';

class NameResponse extends Equatable {
  final bool success;
  final String message;
  final String name;
  final String mobile;

  const NameResponse({
    required this.success,
    required this.message,
    required this.name,
    required this.mobile,
  });

  @override
  List<Object?> get props => [success, message, mobile, name];
}
