import 'dart:convert';
import 'package:http/http.dart' as http;
import 'lightweight_request.dart';

class NetworkService {
  Future<Map<String, dynamic>> execute(LightWeightRequest request) async {
    final client = http.Client();
    try {
      http.Response response;

      // Choose HTTP method based on the request
      switch (request.httpMethod.toUpperCase()) {
        case 'GET':
          response = await client.get(
            request.uri,
            headers: request.headers,
          );
          break;
        case 'POST':
          response = await client.post(
            request.uri,
            headers: request.headers,
            body: jsonEncode(request.bodyParameters),
          );
          break;
        case 'PUT':
          response = await client.put(
            request.uri,
            headers: request.headers,
            body: jsonEncode(request.bodyParameters),
          );
          break;
        case 'DELETE':
          response = await client.delete(
            request.uri,
            headers: request.headers,
          );
          break;
        default:
          throw Exception('Unsupported HTTP method: ${request.httpMethod}');
      }

      // Check for successful response
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Request failed with status code ${response.statusCode}: ${response.body}');
      }
    } finally {
      client.close();
    }
  }
}
