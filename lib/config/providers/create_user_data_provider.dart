import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';

import 'package:formulario_prueba_tecnica/dominio/models/gateway/create_user_gateway.dart';
import 'package:formulario_prueba_tecnica/dominio/usecases/validate_form_controller.dart';
import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/create_user_data_api.dart';

final formProvider = StateNotifierProvider<FormControllerUseCase, UserModel>(
  (ref) => FormControllerUseCase(ref.read(createUserDataProvider)),
);

final createUserDataProvider = Provider<CreateUserDataGateway>(
  (ref) => CreateUserDataApi(),
);
