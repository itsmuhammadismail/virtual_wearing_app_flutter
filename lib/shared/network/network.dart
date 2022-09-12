import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:virtual_wearing_app_flutter/resources/constants.dart';

class NetworkHelper {
  static Future request({
    required String url,
    Map<String, dynamic>? data,
    String token = '',
    String method = 'GET',
  }) async {
    Map<String, String> headers = {};
    headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJoYWZlZXoxQGVtYWlsLmNvbSIsImlhdCI6MTY2MjI3NTA5NywiZXhwIjoxNjYzNDg0Njk3fQ.D30F3Ohg5eIaRpjqwgHNjimjUff8awO-BRBxNjgYV-o';
    if (method == 'POST') {
      headers['Content-Type'] = 'application/json';
    }
    var request = http.Request(method, Uri.parse('$kHost$url'));
    request.body = jsonEncode(data);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    var res = await response.stream.bytesToString().then((value) {
      return jsonDecode(value);
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      return res;
    } else {
      throw Exception(res['error']);
    }
  }
}
