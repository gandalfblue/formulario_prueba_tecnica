import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:formulario_prueba_tecnica/dominio/usecases/create_user_data.dart';
import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/create_user_data_api.dart';

final createUserDataApi = Provider<CreateUserDataUseCase>(
  (ref) {
    return CreateUserDataUseCase(CreateUserDataApi());
  },
);
