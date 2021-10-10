import 'dart:collection';
import 'dart:convert';

import 'package:redis_client/api/api_base.dart';
import 'package:redis_client/http/http_client.dart';
import 'package:redis_client/model/redis_api_responses.dart';

import 'api_response.dart';

class RedisApiProvider {
  final HttpClient httpClient;

  RedisApiProvider(this.httpClient);

  Future<ApiResponse> connect(String hostname, String port) {
    final String url = "$baseAPI/ajax/redis/connect";
    Map<String, String> header = new HashMap();
    header['Content-Type'] = "application/json";

    Map<String, String> body = new HashMap();
    body['host'] = hostname;
    body['port'] = port;

    return httpClient.post(url, headers: header, body: body).then((resp) =>
        ApiResponse(
            successResult:
                ConnectRedisResponse.fromJson(json.decode(resp.body))));
  }

  Future<ApiResponse> getKeys(String pattern) {
    final String url = "$baseAPI/ajax/redis?pattern=$pattern";

    return httpClient.get(url).then((resp) => ApiResponse(
        successResult: GetRedisKeysResponse.fromJson(json.decode(resp.body))));
  }

  Future<ApiResponse> getType(String key) {
    final String url = "$baseAPI/ajax/redis/$key/type";

    return httpClient.get(url).then((resp) => ApiResponse(
        successResult: GetKeyTypeResponse.fromJson(json.decode(resp.body))));
  }
}
