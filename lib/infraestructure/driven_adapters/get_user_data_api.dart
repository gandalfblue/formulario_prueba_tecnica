import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/auth_user_firebase_api.dart';
import 'package:formulario_prueba_tecnica/infraestructure/helpers/env/env.dart';
import 'package:http/http.dart' as http;

import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/errors/user_data_api_errors.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/dominio/models/gateway/get_user_gateway.dart';

class GetUserDataApi extends GetUserDataGateway {
  final _storage = const FlutterSecureStorage();

  @override
  Future<FormularioModel> getUserData() async {
    AuthUserFirebaseApi.signInWithEmailAndPassword();

    String token = await _storage.read(key: 'token') ?? '';

    final url =
        Uri.https(Enviroment.baseUrl, 'userdata/$token.json', {'auth': token});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      FormularioModel userData = FormularioModel.fromJson(response.body);
      return userData;
    } else {
      final decodeData = json.decode(response.body);
      throw UserDataApiError(decodeData['error']['message']);
    }
  }
}
