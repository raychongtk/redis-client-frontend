import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpClient {
  Future<http.Response> get(String url, {Map<String, String>? headers}) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    return response;
  }

  Future<http.Response> post(String url,
      {Map<String, String>? headers, Map<String, String>? body}) async {
    http.Response response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(body));
    print(response.body);
    return response;
  }

  Future<http.Response> put(String url,
      {Map<String, String>? headers, Map<String, String>? body}) async {
    http.Response response = await http.put(Uri.parse(url),
        headers: headers, body: jsonEncode(body));
    return response;
  }

  Future<http.Response> delete(String url,
      {Map<String, String>? headers, Map<String, String>? body}) async {
    http.Response response = await http.delete(Uri.parse(url),
        headers: headers, body: jsonEncode(body));
    return response;
  }
}
