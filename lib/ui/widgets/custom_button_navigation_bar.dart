import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int i) => i = 0,
      currentIndex: 0,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'formulario',
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration),
            label: 'userData',
            backgroundColor: Colors.blue),
      ],
    );
  }
}
