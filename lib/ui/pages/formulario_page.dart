import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:formulario_prueba_tecnica/config/providers/create_user_data_provider.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/appbar.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/calendar.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/drawer.dart';

class FormularioPage extends ConsumerWidget {
  final Future<List<UserModel>> userModels;
  late UserModel userModel;

  FormularioPage(this.userModels, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarWidget.costomAppBar(context, 'Form'),
      drawer: DrawerWidget(userModels: userModels),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) =>
                  ref.read(formProvider.notifier).updateName(value),
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) =>
                  ref.read(formProvider.notifier).updateLastName(value),
              decoration: const InputDecoration(labelText: 'Lastname'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) =>
                  ref.read(formProvider.notifier).updateId(value),
              decoration: const InputDecoration(labelText: 'DNI'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) =>
                  ref.read(formProvider.notifier).addAddress(value),
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(height: 20),
            const Calendar(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción a realizar cuando se presione el botón de enviar.
                // Puedes acceder al estado actual del formulario utilizando `watch`.
                ref.read(formProvider.notifier).submitForm();
                // Realiza acciones adicionales, como enviar los datos al servidor.
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
