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

  void addAddress() {
    final updatedAddresses = List<String>.from(state.address);
    if (updatedAddresses.isEmpty) {
      updatedAddresses.add('');
      updatedAddresses.add('');
    } else {
      updatedAddresses.add('');
    }
    state = state.copyWith(address: updatedAddresses);
  }

  void updateAddress(String address) {
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

  UserModel getDataUser() {
    // if (state.birthdate.isEmpty) {
    //   List<String> date = DateTime.now().toString().split(' ');
    //   state.birthdate = date[0];
    // }
    return state;
  }

  Future<void> submitForm() async {
    await _createUserDataGateway.submitForm(state);
    clearAllData();
  }

  bool verifyFieldVoid() {
    if (state.lastName.length >= 6 &&
        state.name.length >= 5 &&
        state.birthdate.isNotEmpty &&
        state.id!.length >= 8 &&
        state.address.isNotEmpty) {
      return true;
    }
    return false;
  }
}
