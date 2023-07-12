import 'package:flutter/material.dart';
import 'package:formulario_prueba_tecnica/config/routes/app_routes.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/infraestructure/helpers/env/env.dart';

class DrawerWidget extends StatelessWidget {
  final Future<List<UserModel>> userModels;

  const DrawerWidget({super.key, required this.userModels});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 103, 174, 241)),
            accountName: Text('Qwerty'),
            accountEmail: Text(Enviroment.email),
          ),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Form'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.formularioPage,
                  arguments: userModels);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('List Users'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRoutes.listUserPage,
                  arguments: userModels);
            },
          ),
        ],
      ),
    );
  }
}
