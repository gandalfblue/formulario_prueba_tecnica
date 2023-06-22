import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Marvel application'),
        elevation: 0,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.amber,
          height: 100,
        ),
      ),
    );
  }
}
