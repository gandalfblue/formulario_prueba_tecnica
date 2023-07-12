import 'package:flutter/material.dart';

mixin AppBarWidget {
  static AppBar costomAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: const Color(0xFF76B24E),
      title: const Text("List Users"),
      titleTextStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      centerTitle: true,
      elevation: 4,
    );
  }
}
