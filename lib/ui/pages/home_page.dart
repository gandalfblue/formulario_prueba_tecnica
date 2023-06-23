import 'package:flutter/material.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/custom_button_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home application'),
        elevation: 0,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.amber,
          height: 100,
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
