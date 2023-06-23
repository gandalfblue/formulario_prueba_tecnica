import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/dominio/models/gateway/create_user_gateway.dart';

class CreateUserDataUseCase {
  final CreateUserDataGateway createuserDataGateway;

  CreateUserDataUseCase(this.createuserDataGateway);

  Future<FormularioModel> createUserData(FormularioModel user) =>
      createuserDataGateway.createUserData(user);
}
