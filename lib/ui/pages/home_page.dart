import 'package:flutter/material.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.costomAppBar(context, 'Home'),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.amber,
          height: 100,
        ),
      ),
    );
  }
}
