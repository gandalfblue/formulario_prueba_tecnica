import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:formulario_prueba_tecnica/config/providers/create_user_data_provider.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/appbar.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/calendar.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/drawer.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/list_addressess.dart';

class FormularioPage extends ConsumerStatefulWidget {
  final Future<List<UserModel>> userModels;
  const FormularioPage(this.userModels, {Key? key}) : super(key: key);

  @override
  FormularioPageState createState() => FormularioPageState();
}

class FormularioPageState extends ConsumerState<FormularioPage> {
  late List<String> formFields;
  TextEditingController dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.read(formProvider);
    dateController.text =
        ref.read(formProvider.notifier).getDataUser().birthdate;
    if (ref.read(formProvider.notifier).getDataUser().address.isEmpty) {
      formFields = [];
    } else {
      formFields = ref.read(formProvider.notifier).getDataUser().address;
    }
  }

  @override
  void dispose() {
    dateController.dispose();
    addressController.dispose();
    super.dispose();
  }

  _updateMyTitle(int index) {
    setState(() {
      ref.read(formProvider.notifier).removeAddress(index);
      formFields = ref.read(formProvider.notifier).getDataUser().address;
      dateController.text =
          ref.read(formProvider.notifier).getDataUser().birthdate;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> keyForm = GlobalKey();
    String name = ref.watch(formProvider.notifier).getDataUser().name;
    String lastname = ref.watch(formProvider.notifier).getDataUser().lastName;
    String dni = ref.watch(formProvider.notifier).getDataUser().id!;

    return Scaffold(
      appBar: AppBarWidget.costomAppBar(context, 'Form'),
      drawer: DrawerWidget(userModels: widget.userModels),
      body: SingleChildScrollView(
        child: Form(
          key: keyForm,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(16.0),
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    initialValue: name,
                    onChanged: (value) =>
                        ref.read(formProvider.notifier).updateName(value),
                    onSaved: (value) {
                      ref.read(formProvider.notifier).updateName(value!);
                    },
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      String pattern = r'(^[a-zA-Z ]*$)';
                      RegExp regExp = RegExp(pattern);
                      if (value == null || value.length < 5) {
                        return 'The field is required and must be longer than 5 letters';
                      } else if (!regExp.hasMatch(value)) {
                        return "The name must be a-z and A-Z";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    initialValue: lastname,
                    onChanged: (value) =>
                        ref.read(formProvider.notifier).updateLastName(value),
                    onSaved: (value) =>
                        ref.read(formProvider.notifier).updateLastName(value!),
                    decoration: const InputDecoration(labelText: 'Lastname'),
                    validator: (value) {
                      String pattern = r'(^[a-zA-Z ]*$)';
                      RegExp regExp = RegExp(pattern);
                      if (value == null || value.length < 6) {
                        return 'The field is required and must be longer than 6 letters';
                      } else if (!regExp.hasMatch(value)) {
                        return "The name must be a-z and A-Z";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    initialValue: dni,
                    onChanged: (value) =>
                        ref.read(formProvider.notifier).updateId(value),
                    onEditingComplete: () {},
                    onSaved: (value) => ref
                        .read(formProvider.notifier)
                        .updateId(value.toString()),
                    decoration: const InputDecoration(labelText: 'DNI'),
                    validator: (value) {
                      return (value != null && value.length >= 8)
                          ? null
                          : 'the field is required and must be longer than 8 numbers';
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    readOnly: true,
                    controller: dateController,
                    onChanged: (value) {
                      ref.read(formProvider.notifier).updateBirthdate(value);
                      dateController.text = ref
                          .read(formProvider.notifier)
                          .getDataUser()
                          .birthdate;
                    },
                    decoration: InputDecoration(
                      labelText: 'Birthdate',
                      suffixIcon: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CalendarWidget(context, dateController);
                              });
                        },
                        icon: const Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                    validator: (value) {
                      return (value != null) ? null : 'The field is required';
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    controller: addressController,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      suffixIcon: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  ref
                                      .read(formProvider.notifier)
                                      .updateAddress(addressController.text);
                                  formFields = ref.read(formProvider).address;
                                  addressController.text = '';
                                });
                              },
                              icon: const Icon(Icons.check_circle_outline),
                            ),
                          ],
                        ),
                      ),
                    ),
                    validator: (value) {
                      return (value != null && value.length >= 15)
                          ? null
                          : 'the field is required and must be longer than 15 letters';
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Addresses entered',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              const SizedBox(height: 20),
              AddressessListWidget(
                  context: context,
                  listAddresses: formFields,
                  parentAction: _updateMyTitle),
              ElevatedButton(
                onPressed: ref.read(formProvider.notifier).verifyFieldVoid()
                    ? () {
                        ref.read(formProvider.notifier).submitForm();
                        dateController.clear();
                        addressController.clear();
                        formFields = [];
                        Future.delayed(const Duration(milliseconds: 600), () {
                          setState(() {});
                        });
                      }
                    : null,
                child: const Text('Submitted'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
