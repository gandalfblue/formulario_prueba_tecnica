import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:formulario_prueba_tecnica/dominio/models/gateway/create_user_gateway.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';

class FormControllerUseCase extends StateNotifier<UserModel> {
  final CreateUserDataGateway _createUserDataGateway;

  FormControllerUseCase(this._createUserDataGateway)
      : super(UserModel(
            id: '', name: '', lastName: '', birthdate: '', address: []));

  void updateName(String value) {
    state = state.copyWith(name: value);
  }

  void updateLastName(String value) {
    state = state.copyWith(lastName: value);
  }

  void updateId(String value) {
    state = state.copyWith(id: value);
  }

  void updateBirthdate(String value) {
    state = state.copyWith(birthdate: value);
  }

  String getBirthdate() {
    String birthdate = state.birthdate;
    if (birthdate.isEmpty) {
      return '';
    }
    print(birthdate);
    return birthdate;
  }

  void addAddress(String address) {
    final updatedAddresses = List<String>.from(state.address);
    updatedAddresses.add(address);
    state = state.copyWith(address: updatedAddresses);
  }

  void removeAddress(int index) {
    final updatedAddresses = List<String>.from(state.address);
    updatedAddresses.removeAt(index);
    state = state.copyWith(address: updatedAddresses);
  }

  void clearAllData() {
    state.name = '';
    state.lastName = '';
    state.id = '';
    state.birthdate = '';
    state.address.clear();
  }

  Future<void> validateForm() async {
    await _createUserDataGateway.validateForm(state);
  }

  Future<void> submitForm() async {
    await _createUserDataGateway.submitForm(state);
  }
}
