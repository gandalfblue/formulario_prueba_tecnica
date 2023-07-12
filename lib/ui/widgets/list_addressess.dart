import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressessListWidget extends ConsumerStatefulWidget {
  final BuildContext context;
  final List<String> listAddresses;
  final void Function(int) parentAction;

  const AddressessListWidget({
    super.key,
    required this.context,
    required this.listAddresses,
    required this.parentAction,
  });
  @override
  AddressessListWidgetState createState() => AddressessListWidgetState();
}

class AddressessListWidgetState extends ConsumerState<AddressessListWidget> {
  @override
  Widget build(context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.listAddresses.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              TextFormField(
                readOnly: true,
                initialValue: widget.listAddresses[index],
                decoration: InputDecoration(
                  labelText: 'Address',
                  suffixIcon: IconButton(
                    onPressed: () {
                      widget.parentAction(index);
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ),
                validator: (value) {
                  return (value != null &&
                          value.length >= 15 &&
                          widget.listAddresses.isNotEmpty)
                      ? null
                      : 'The field is required and must be longer than 15 letters';
                },
              ),
              const SizedBox(height: 20),
            ],
          );
        });
  }
}
