import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formulario_prueba_tecnica/config/providers/create_user_data_provider.dart';

class TextFormFieldsAddressWidget extends ConsumerWidget {
  final List<Widget> formFields;

  const TextFormFieldsAddressWidget(this.formFields, {super.key});
  @override
  Widget build(context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(height: 20),
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: 'Address',
              suffixIcon: IconButton(
                onPressed: () {
                  formFields.add(TextFormFieldsAddressWidget(formFields));
                },
                icon: const Icon(Icons.add),
              )),
          validator: (value) {
            return (value != null && value.length >= 15)
                ? null
                : 'the field is required and must be longer than 15 letters';
          },
        ),
      ],
    );
  }
}
