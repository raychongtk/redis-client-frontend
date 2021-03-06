import 'dart:collection';
import 'dart:convert';

import 'package:redis_client/http/http_client.dart';
import 'package:redis_client/model/redis_string_api_responses.dart';

import 'api_base.dart';
import 'api_response.dart';

class RedisStringApiProvider {
  final HttpClient httpClient;

  RedisStringApiProvider(this.httpClient);

  Future<ApiResponse> get(String key) {
    final String url = "$baseAPI/ajax/redis/string/$key";

    return httpClient.get(url).then((resp) => ApiResponse(
        successResult:
            GetStringValueResponse.fromJson(json.decode(resp.body))));
  }

  void set(String key, String value) async {
    final String url = "$baseAPI/ajax/redis/string/$key";
    Map<String, String> header = new HashMap();
    header['Content-Type'] = "application/json";

    Map<String, String> body = new HashMap();
    body['value'] = value;

    await httpClient.post(url, headers: header, body: body);
  }
}
