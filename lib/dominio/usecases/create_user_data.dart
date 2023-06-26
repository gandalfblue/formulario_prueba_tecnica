import 'package:formulario_prueba_tecnica/infraestructure/driven_adapters/errors/validate_form_error.dart';

class CreateUserDataUseCase {
  ValidationFormException? validateForm(String error) {
    if (error == 'isEmpty') {
      throw ValidationFormException('error-isEmpty');
    }

    if (error == 'isNumber') {
      throw ValidationFormException('error-isNumber');
    }
    return null;
  }
}
