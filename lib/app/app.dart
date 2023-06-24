import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:formulario_prueba_tecnica/config/providers/get_user_data_provider.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: Colors.blueAccent),
      ),
      initialRoute: AppRoutes.listUserPage,
      onGenerateRoute: (routeSetting) {
        switch (routeSetting.name) {
          case (AppRoutes.formulario):
            return MaterialPageRoute(
                builder: ((context) => FormularioPage(
                    ref.watch(getUserDataProvider).getUserData())));
          case (AppRoutes.listUserPage):
            return MaterialPageRoute(
                builder: ((context) => ListUserPage(
                      userModels: ref.watch(getUserDataProvider).getUserData(),
                    )));
          case (AppRoutes.userData):
            return MaterialPageRoute(builder: ((context) => UserDataPage()));
          default:
            return MaterialPageRoute(builder: ((context) => HomePage()));
        }
      },
    );
  }
}
