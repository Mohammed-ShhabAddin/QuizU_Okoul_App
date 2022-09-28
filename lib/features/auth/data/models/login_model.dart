import '../../domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel({
    required super.otp,
    required super.mobile,
  });

// //
  Map<String, dynamic> toJson() => {
        "OTP": otp,
        "mobile": mobile,
      };
}

class LoginResponseModel extends LoginResponse {
  const LoginResponseModel(
      {required super.success, //يفضل تلغيه
      required super.msg, //يفضل تلغيه لا داعي لهم
      required super.token,
      required super.name,
      required super.mobile});

  factory LoginResponseModel.formJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json["success"],
      msg: json["msg"],
      token: json["token"] ?? "",
      name: json["name"],
      mobile: json["mobile"] ?? "",
    );
  }
//unnecessary
  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "token": token,
        "name": name,
        "mobile": mobile,
      };
}
