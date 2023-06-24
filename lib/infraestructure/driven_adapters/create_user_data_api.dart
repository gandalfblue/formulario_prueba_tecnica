import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/errors/validate_form_error.dart';
import 'package:http/http.dart' as http;

import 'package:formulario_prueba_tecnica/infraestructure/helpers/env/env.dart';
import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/auth_user_firebase_api.dart';
import 'package:formulario_prueba_tecnica/dominio/models/gateway/create_user_gateway.dart';
import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/errors/user_data_api_errors.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';

class CreateUserDataApi extends CreateUserDataGateway {
  @override
  Future<void> submitForm(UserModel user) async {
    AuthUserFirebaseApi.signInWithEmailAndPassword();
    const storage = FlutterSecureStorage();
    String token = await storage.read(key: 'token') ?? '';

    final url = Uri.https(Enviroment.baseUrl, 'userdata/$token.json', {'auth': token});

    final response = await http.post(url, body: user.toJson());

    if (response.statusCode == 200) {
      return;
    } else {
      final decodeData = json.decode(response.body);
      throw UserDataApiError(decodeData['error']);
    }
  }

  @override
  Future<void> validateForm(UserModel user) async {
    if (user.name.isEmpty) {
      throw ValidationFormException('name-isEmpty');
    }

    if (user.lastName.isEmpty) {
      throw ValidationFormException('lastname-isEmpty');
    }

    if (user.birthdate.toString().isEmpty) {
      throw ValidationFormException('birthdate-isEmpty');
    }

    if (user.address.isEmpty) {
      throw ValidationFormException('address-isEmpty');
    }
  }
}
