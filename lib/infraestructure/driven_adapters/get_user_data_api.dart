import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/auth_user_firebase_api.dart';
import 'package:formulario_prueba_tecnica/infraestructure/helpers/env/env.dart';
import 'package:http/http.dart' as http;

import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/errors/user_data_api_errors.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/dominio/models/gateway/get_user_gateway.dart';

class GetUserDataApi extends GetUserDataGateway {
  @override
  Future<List<UserModel>> getUserData() async {
    final List<UserModel> userModels = [];
    AuthUserFirebaseApi.signInWithEmailAndPassword();
    const storage = FlutterSecureStorage();

    String token = await storage.read(key: 'token') ?? '';

    final url =
        Uri.https(Enviroment.baseUrl, 'userdata/$token.json', {'auth': token});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodeData = json.decode(response.body);

      decodeData.forEach((key, value) {
        UserModel userData = UserModel.fromMap(value);
        userModels.add(userData);
      });

      return userModels;
    } else {
      final decodeData = json.decode(response.body);
      throw UserDataApiError(decodeData['error']['message']);
    }
  }
}
