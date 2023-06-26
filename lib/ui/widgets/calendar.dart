import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:formulario_prueba_tecnica/config/providers/create_user_data_provider.dart';

class CalendarWidget extends ConsumerWidget {
  final BuildContext context;

  CalendarWidget(this.context);

  @override
  Widget build(context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Select a date'),
      backgroundColor: Colors.black,
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: SfDateRangePicker(
          initialSelectedDate: DateTime.now(),
          selectionMode: DateRangePickerSelectionMode.single,
          selectionColor: Colors.black26,
          showActionButtons: true,
          toggleDaySelection: false,
          todayHighlightColor: Colors.blue,
          backgroundColor: Colors.white30,
          onSubmit: (value) {
            List<String> date = value.toString().split(' ');
            ref.read(formProvider.notifier).updateBirthdate(date[0]);
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
