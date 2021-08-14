import 'package:redis_client/api/api_base.dart';
import 'package:redis_client/http/http_client.dart';

import 'api_response.dart';

class RedisApiProvider {
  final HttpClient httpClient;

  RedisApiProvider(this.httpClient);

  Future<ApiResponse> getKeys() {
    final String url = "$baseAPI/redis/keys";

    return httpClient.get(url).then((resp) => ApiResponse());
  }
}
