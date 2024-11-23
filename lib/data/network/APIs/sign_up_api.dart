
import 'package:flutter_application_1/data/network/lightweight_request.dart';

class SignUpAPI implements LightWeightRequest {
  final String name;
  final String email;
  final String password;

  SignUpAPI({required this.name, required this.email, required this.password});

  @override
  String get url => 'http://localhost:3000/api/v1/users/sign-up';

  @override
  String get httpMethod => 'POST';

  @override
  Map<String, dynamic>? get bodyParameters => {
        'name': name,
        'email': email,
        'password': password,
      };

  @override
  Map<String, dynamic>? get urlParameters => null;

  @override
  Map<String, String>? get headers => null;
  
  @override
  // TODO: implement uri
  Uri get uri => throw UnimplementedError();
}
