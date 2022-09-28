import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../domain/entity/token_entity.dart';

import '../model/token_model.dart';

abstract class TokenRemoteDataSource {
  Future<TokenVerification> verifyTokenStatus();
}

class TokenRemoteDataSourceImpl implements TokenRemoteDataSource {
  ApiConsumer apiConsumer;

  TokenRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<TokenVerification> verifyTokenStatus() async {
    final response = await apiConsumer.get(EndPoints.token);
    final tokenStatus = TokenVerificationModel.fromJson(response);

    return tokenStatus;
  }
}
