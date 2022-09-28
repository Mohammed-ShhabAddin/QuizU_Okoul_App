import '../../domain/entities/profile.dart';

class ProfileInfoModel extends ProfileInfo {
  const ProfileInfoModel({
    required super.mobile,
    required super.name,
  });

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) {
    return ProfileInfoModel(
      mobile: json["mobile"],
      name: json["name"] ?? "msa",
    );
  }

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "name": name,
      };
}
