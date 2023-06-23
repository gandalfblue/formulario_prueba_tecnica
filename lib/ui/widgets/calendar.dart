import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_dateTime == null
                ? 'Nothing has been picked yet'
                : _dateTime.toString()),
            ElevatedButton(
              child: const Text('Pick a date'),
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: _dateTime ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2023))
                    .then((date) {
                  setState(() {
                    _dateTime = date;
                    ref.read(formProvider.notifier).updateBirthdate(_dateTime!);
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
