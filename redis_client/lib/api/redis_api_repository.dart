import 'package:redis_client/api/api_response.dart';
import 'package:redis_client/api/redis_api_provider.dart';
import 'package:redis_client/model/redis_api_responses.dart';

class RedisApiRepository {
  final RedisApiProvider redisApiProvider;

  RedisApiRepository(this.redisApiProvider);

  Future<ConnectRedisResponse> connectRedis(
      String hostname, String port) async {
    ApiResponse apiResponse = await redisApiProvider.connect(hostname, port);

    if (apiResponse.error != null) {
      return apiResponse.error;
    }

    final redisConnection = cast(apiResponse.successResult);

    if (redisConnection == null) {
      throw new Exception("something went wrong");
    }

    return redisConnection;
  }

  Future<GetRedisKeysResponse> getRedisKeys() async {
    ApiResponse apiResponse = await redisApiProvider.getKeys();

    if (apiResponse.error != null) {
      return apiResponse.error;
    }

    final redisKeys = cast(apiResponse.successResult);

    if (redisKeys == null) {
      throw new Exception("something went wrong");
    }

    return redisKeys;
  }
}
