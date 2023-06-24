import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:formulario_prueba_tecnica/config/providers/create_user_data_provider.dart';

class Calendar extends ConsumerStatefulWidget {
  const Calendar({super.key});

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends ConsumerState<Calendar> {
  DateTime? _dateTime;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: SfDateRangePicker(
                  initialSelectedDate: DateTime.now(),
                  selectionMode: DateRangePickerSelectionMode.single,
                  selectionColor: Colors.black26,
                  showActionButtons: true,
                  onSubmit: (value) {
                    ref
                        .read(formProvider.notifier)
                        .updateBirthdate(value.toString());
                  },
                ),
              ),
            ),
          ],
        ),
    );
  }
}
