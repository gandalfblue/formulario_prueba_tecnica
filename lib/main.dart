import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:formulario_prueba_tecnica/app/app.dart';

bool shouldUseFirebaseEmulator = false;

void main() {
  runApp(const ProviderScope(
    child: FormularioPruebaTecnicaFlutterApp(),
  ));
}
