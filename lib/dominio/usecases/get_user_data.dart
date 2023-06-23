import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/dominio/models/gateway/get_user_gateway.dart';

class GetUserDataUseCase {
  final GetUserDataGateway getuserDataGateway;

  GetUserDataUseCase(this.getuserDataGateway);

  Future<List<UserModel>> getUserData() => getuserDataGateway.getUserData();
}
