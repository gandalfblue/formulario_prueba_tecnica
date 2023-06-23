import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/auth_user_firebase_api.dart';
import 'package:formulario_prueba_tecnica/infraestructure/helpers/env/env.dart';
import 'package:http/http.dart' as http;

import 'package:formulario_prueba_tecnica/dominio/models/gateway/create_user_gateway.dart';
import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/errors/user_data_api_errors.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';

class CreateUserDataApi extends CreateUserDataGateway {
  final _storage = const FlutterSecureStorage();

  @override
  Future<FormularioModel> createUserData(FormularioModel user) async {
    AuthUserFirebaseApi.signInWithEmailAndPassword();
    String token = await _storage.read(key: 'token') ?? '';

    final url =
        Uri.https(Enviroment.baseUrl, 'userdata/$token.json', {'auth': token});
    final response = await http.put(url, body: user.toJson());

    if (response.statusCode == 200) {
      return user;
    } else {
      final decodeData = json.decode(response.body);
      throw UserDataApiError(decodeData['error']['message']);
    }
  }
}
