import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/errors/auth_user_data_api_errors.dart';
import 'package:formulario_prueba_tecnica/infraestructure/helpers/env/env.dart';
import 'package:http/http.dart' as http;

class AuthUserFirebaseApi {
  static Future<int> signInWithEmailAndPassword() async {
    String baseUrl = 'identitytoolkit.googleapis.com';
    var storage = const FlutterSecureStorage();

    final Map<String, dynamic> authData = {
      'email': Enviroment.email,
      'password': Enviroment.password,
      'returnSecureToken': true
    };

    final url = Uri.https(
        baseUrl, '/v1/accounts:signInWithPassword', {'key': Enviroment.token});

    final response = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> decodedResp = json.decode(response.body);

    if (decodedResp.containsKey('localId')) {
      await storage.write(key: 'token', value: decodedResp['localId']);
      await storage.write(key: 'email', value: decodedResp['email']);
      return response.statusCode;
    } else {
      final decodeData = json.decode(response.body);
      throw AuthUserDataApiError(decodeData['error']['message']);
    }
  }

  static Future logout() async {
    var storage = const FlutterSecureStorage();
    await storage.delete(key: 'token');
    return;
  }

  static Future<String> readToken() async {
    var storage = const FlutterSecureStorage();
    return await storage.read(key: 'token') ?? '';
  }
}
