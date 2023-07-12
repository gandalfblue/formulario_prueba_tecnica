import 'dart:async';

import 'package:flutter/material.dart';

import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/appbar.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/drawer.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/list_users_widget.dart';

class ListUserPage extends StatelessWidget {
  final Future<List<UserModel>> userModels;

  const ListUserPage({Key? key, required this.userModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(),
      child: Scaffold(
        appBar: AppBarWidget.costomAppBar(context, 'List Users'),
        drawer: DrawerWidget(userModels: userModels),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<UserModel>>(
            future: userModels,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              List<UserModel> listViewUsers = snapshot.data!;
              return ListUsersWidget(listViewUsers: listViewUsers);
            },
          ),
        ),
      ),
    );
  }
}
