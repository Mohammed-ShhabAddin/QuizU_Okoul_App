import '../models/name_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';

abstract class NameRemoteDataSource {
  Future<NameResponseModel> uploadUsername(String name);
}

class NameRemoteDataSourceImpl implements NameRemoteDataSource {
  ApiConsumer apiConsumer;

  NameRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<NameResponseModel> uploadUsername(String name) async {
    final response =
        await apiConsumer.post(EndPoints.name, body: {"name": name});
    final nameResponseModel = NameResponseModel.fromJson(response);
    print(" msa msa msa msa $nameResponseModel");
    return nameResponseModel;
  }
}
