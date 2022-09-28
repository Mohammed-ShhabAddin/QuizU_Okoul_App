// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:quizu_okuoul_app/core/api/api_consumer.dart';
import 'package:quizu_okuoul_app/core/api/end_points.dart';

import '../models/profile.model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileInfoModel> getUserProfileInfo();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ApiConsumer apiConsumer;

  ProfileRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<ProfileInfoModel> getUserProfileInfo() async {
    final response = await apiConsumer.get(EndPoints.userInfo);
    final profileInfoModel = ProfileInfoModel.fromJson(response);

    return profileInfoModel;
  }
}
