import 'dart:convert';

import '../models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/app_strings.dart';

abstract class LoginLocalDataSource {
  Future<LoginResponseModel> getCachedLogingResponse(); //change its name
  Future<void> cachLoginResponse(
      LoginResponseModel loginRespons); //change its name

}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final SharedPreferences sharedPreferences;

  LoginLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<void> cachLoginResponse(LoginResponseModel loginRespons) {
    return sharedPreferences.setString(
        AppStrings.cachLoginResponse, json.encode(loginRespons));
  }

  @override
  Future<LoginResponseModel> getCachedLogingResponse() async {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachLoginResponse);
    if (jsonString != null) {
      //الافضل ترجع موديل فاضي في قيم معينة بتدل انو مانك مستخدم لسا
      final cachedLoginInfo = await Future.value(
          LoginResponseModel.formJson(json.decode(jsonString)));
      return cachedLoginInfo;
    } else {
      throw CacheException();
    }
  }
}
