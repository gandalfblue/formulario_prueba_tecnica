import 'package:formulario_prueba_tecnica/dominio/models/user.dart';

abstract class CreateUserDataGateway {
  Future<void> submitForm(UserModel user);
  Future<void> validateForm(UserModel user);
}
