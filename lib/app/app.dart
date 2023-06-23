import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formulario_prueba_tecnica/config/providers/create_user_data_provider.dart';

import 'package:formulario_prueba_tecnica/config/routes/app_routes.dart';

import 'package:formulario_prueba_tecnica/ui/pages/formulario.dart';

import 'package:formulario_prueba_tecnica/ui/pages/home.dart';
import 'package:formulario_prueba_tecnica/ui/pages/user_data.dart';

class FormularioPruebaTecnicaFlutterApp extends ConsumerWidget {
  const FormularioPruebaTecnicaFlutterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: Colors.blueAccent),
      ),
      onGenerateRoute: (routeSetting) {
        switch (routeSetting.name) {
          case (AppRoutes.formulario):
            return MaterialPageRoute(builder: ((context) => FormularioPage()));
          case (AppRoutes.userData):
            return MaterialPageRoute(
                builder: ((context) => UserDataDetailsPage()));
          default:
            return MaterialPageRoute(builder: ((context) => FormularioPage()));
        }
      },
    );
  }
}
