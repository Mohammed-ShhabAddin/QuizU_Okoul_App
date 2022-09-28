import '../../domain/entities/name.dart';

class NameResponseModel extends NameResponse {
  const NameResponseModel(
      {required super.success,
      required super.message,
      required super.name,
      required super.mobile});

  factory NameResponseModel.fromJson(Map<String, dynamic> json) {
    return NameResponseModel(
      success: json["success"],
      message: json["message"],
      name: json["name"],
      mobile: json["mobile"],
    );
  }
}
