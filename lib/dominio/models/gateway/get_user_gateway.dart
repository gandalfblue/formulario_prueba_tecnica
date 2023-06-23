import 'package:formulario_prueba_tecnica/dominio/models/user.dart';

abstract class GetUserDataGateway {
  Future<List<UserModel>> getUserData();
}
