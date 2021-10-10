import 'package:redis_client/api/api_response.dart';
import 'package:redis_client/api/redis_string_api_provider.dart';
import 'package:redis_client/model/redis_string_api_responses.dart';

class RedisStringApiRepository {
  final RedisStringApiProvider redisStringApiProvider;

  RedisStringApiRepository(this.redisStringApiProvider);

  Future<GetStringValueResponse> get(String key) async {
    ApiResponse apiResponse = await redisStringApiProvider.get(key);

    if (apiResponse.error != null) {
      return apiResponse.error;
    }

    final redisString = cast(apiResponse.successResult);

    if (redisString == null) {
      throw new Exception("something went wrong");
    }

    return redisString;
  }
}
