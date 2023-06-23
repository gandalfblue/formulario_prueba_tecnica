import 'dart:js_interop';

import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/dominio/models/gateway/create_user_gateway.dart';
import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/create_user_data_api.dart';
import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/errors/validate_form_error.dart';

class CreateUserDataUseCase implements CreateUserDataGateway {
  CreateUserDataUseCase(CreateUserDataApi createUserDataApi);

  @override
  Future<void> submitForm(UserModel user) {
    // TODO: implement submitForm
    throw UnimplementedError();
  }

  @override
  Future<void> validateForm(UserModel user) async {
    if (user.name.isEmpty) {
      throw ValidationFormException('name-isEmpty');
    }

    if (user.lastName.isEmpty) {
      throw ValidationFormException('lastname-isEmpty');
    }

    if (user.birthdate.isUndefinedOrNull) {
      throw ValidationFormException('birthdate-isUndefinedOrNull');
    }

    if (user.address.isEmpty) {
      throw ValidationFormException('address-isEmpty');
    }
  }
}
