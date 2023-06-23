import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:formulario_prueba_tecnica/config/routes/app_routes.dart';
import 'package:formulario_prueba_tecnica/ui/pages/formulario_page.dart';
import 'package:formulario_prueba_tecnica/ui/pages/home_page.dart';
import 'package:formulario_prueba_tecnica/ui/pages/list_user_page.dart';
import 'package:formulario_prueba_tecnica/ui/pages/user_data_page.dart';

class FormularioPruebaTecnicaFlutterApp extends ConsumerWidget {
  const FormularioPruebaTecnicaFlutterApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: Colors.blueAccent),
      ),
      initialRoute: AppRoutes.listuserPage,
      onGenerateRoute: (routeSetting) {
        switch (routeSetting.name) {
          case (AppRoutes.home):
            return MaterialPageRoute(builder: ((context) => UserDataPage()));
          case (AppRoutes.formulario):
            return MaterialPageRoute(builder: ((context) => FormularioPage()));
          case (AppRoutes.listuserPage):
            return MaterialPageRoute(
                builder: ((context) => const ListUserPage()));
          default:
            return MaterialPageRoute(builder: ((context) => const HomePage()));
        }
      },
    );
  }
}
