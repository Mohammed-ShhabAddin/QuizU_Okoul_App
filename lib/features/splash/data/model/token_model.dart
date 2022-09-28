import '../../domain/entity/token_entity.dart';

class TokenVerificationModel extends TokenVerification {
  const TokenVerificationModel({
    required super.success,
    required super.message,
  });

  factory TokenVerificationModel.fromJson(Map<String, dynamic> json) {
    return TokenVerificationModel(
      success: json["success"],
      message: json["message"],
    );
  }
}
