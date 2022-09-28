import '../models/login_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../domain/entities/login.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel?> askForLogin(
      Login login); //sure need parameters number & OTP
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  ApiConsumer apiConsumer;

  LoginRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<LoginResponseModel?> askForLogin(login) async {
    //
    try {
      final response = await apiConsumer.post(EndPoints.login,
          // body: loginModel.toJson(), //provide body
          body: {"OTP": login.otp, "mobile": login.mobile});
      //
      final loginResponseModel = LoginResponseModel.formJson(response);
      //لازم خزن القيم هون بالشيرد
      print("at login remorte data source");
      return loginResponseModel;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
