import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:formulario_prueba_tecnica/config/providers/create_user_data_provider.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/calendar.dart';

class FormularioPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form application'),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) =>
                  ref.read(formProvider.notifier).updateName(value),
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) =>
                  ref.read(formProvider.notifier).updateLastName(value),
              decoration: const InputDecoration(labelText: 'Apellido'),
            ),
            const SizedBox(height: 20),
            const Calendar(),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) =>
                  ref.read(formProvider.notifier).addAddress(value),
              decoration: const InputDecoration(labelText: 'Dirección'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acción a realizar cuando se presione el botón de enviar.
                // Puedes acceder al estado actual del formulario utilizando `watch`.
                final currentForm = ref.watch(createUserDataProvider);
                // Realiza acciones adicionales, como enviar los datos al servidor.
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
