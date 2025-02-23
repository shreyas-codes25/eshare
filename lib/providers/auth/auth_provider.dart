import 'package:eshare/providers/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:io';

class ApiProvider {
  // Generic POST request
  static Future<dynamic> post({
    required String endPoint,
    required Map<String, String> headers,
    Map<String, dynamic>? body,
  }) async {
    final String apiUrl = "${ApiEndpoints.baseUrl}$endPoint";
    dynamic responseJson;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
      );
      responseJson = _responseHandler(response);
    } on SocketException {
      throw Exception("No Internet Connection");
    }
    return responseJson;
  }

  // Generic GET request
  static Future<dynamic> get({
    required String endPoint,
    required Map<String, String> headers,
  }) async {
    final String apiUrl = "${ApiEndpoints.baseUrl}$endPoint";
    dynamic responseJson;

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );
      responseJson = _responseHandler(response);
    } on SocketException {
      throw Exception("No Internet Connection");
    }
    return responseJson;
  }

  // Response handler
  static dynamic _responseHandler(http.Response response) {
    switch (response.statusCode) {
      case 200:
        // Check if the response is JSON or plain text
        if (response.body.startsWith('{') || response.body.startsWith('[')) {
          return jsonDecode(response.body);
        } else {
          // Wrap plain text response in a JSON-like format
          return {"message": response.body.trim()};
        }
      case 400:
        throw Exception("Bad Request");
      case 401:
        throw Exception("Unauthorized");
      case 403:
        throw Exception("Forbidden");
      case 404:
        throw Exception("Not Found");
      case 500:
        throw Exception("Internal Server Error");
      default:
        throw Exception("Unexpected Error: ${response.statusCode}");
    }
  }
}
