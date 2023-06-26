import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:formulario_prueba_tecnica/config/providers/create_user_data_provider.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/appbar.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/calendar.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/drawer.dart';

class FormularioPage extends ConsumerStatefulWidget {
  final Future<List<UserModel>> userModels;
  const FormularioPage(this.userModels, {Key? key}) : super(key: key);

  @override
  FormularioPageState createState() => FormularioPageState();
}

class FormularioPageState extends ConsumerState<FormularioPage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    ref.read(formProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.costomAppBar(context, 'Form'),
      drawer: DrawerWidget(userModels: widget.userModels),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.text,
              onChanged: (value) =>
                  ref.read(formProvider.notifier).updateName(value),
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                return (value != null && value.length >= 3)
                    ? null
                    : 'Ehe field is required and must be longer than 3 letters ';
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.text,
              onChanged: (value) =>
                  ref.read(formProvider.notifier).updateLastName(value),
              decoration: const InputDecoration(labelText: 'Lastname'),
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'the field is required and must be longer than 6 letters';
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  ref.read(formProvider.notifier).updateId(value.toString()),
              decoration: const InputDecoration(labelText: 'DNI'),
              validator: (value) {
                return (value != null && value.length >= 8)
                    ? null
                    : 'the field is required and must be longer than 8 letters';
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.streetAddress,
              onChanged: (value) =>
                  ref.read(formProvider.notifier).addAddress(value),
              decoration: const InputDecoration(labelText: 'Address'),
              validator: (value) {
                return (value != null && value.length >= 15)
                    ? null
                    : 'the field is required and must be longer than 15 letters';
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              controller: TextEditingController(
                  text: ref.watch(formProvider.select((p) => p.birthdate))),
              decoration: InputDecoration(
                labelText: 'Birthdate',
                suffixIcon: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CalendarWidget(context);
                        });
                  },
                  icon: const Icon(Icons.calendar_month_outlined),
                ),
              ),
              validator: (value) {
                return (value != null) ? null : 'the field is required';
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: ref.read(formProvider.notifier).verifyFieldVoid()
                  ? () {
                      ref.read(formProvider.notifier).submitForm();
                    }
                  : null,
              child: const Text('Submitted'),
            ),
          ],
        ),
      ),
    );
  }
}
