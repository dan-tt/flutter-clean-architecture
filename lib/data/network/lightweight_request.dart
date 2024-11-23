abstract class LightWeightRequest {
  String get url; // The URL for the API request
  String get httpMethod; // HTTP method: GET, POST, PUT, DELETE, etc.
  Map<String, dynamic>? get bodyParameters; // Request body for POST/PUT
  Map<String, dynamic>? get urlParameters; // Query parameters
  Map<String, String>? get headers; // HTTP headers

  Uri get uri {
    // Build the URI with query parameters
    final uri = Uri.parse(url);
    if (urlParameters != null && urlParameters!.isNotEmpty) {
      return uri.replace(queryParameters: {
        ...uri.queryParameters,
        ...urlParameters!.map((key, value) => MapEntry(key, value.toString())),
      });
    }
    return uri;
  }
}
