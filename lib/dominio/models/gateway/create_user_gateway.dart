import 'package:formulario_prueba_tecnica/dominio/models/user.dart';

abstract class CreateUserDataGateway {
  Future<FormularioModel> createUserData(FormularioModel user);
}
