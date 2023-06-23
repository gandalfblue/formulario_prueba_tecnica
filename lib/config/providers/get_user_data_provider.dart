import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formulario_prueba_tecnica/dominio/usecases/get_user_data.dart';
import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/get_user_data_api.dart';

final getUserDataProvider = Provider<GetUserDataUseCase>(
  (ref) {
    return GetUserDataUseCase(GetUserDataApi());
  },
);
