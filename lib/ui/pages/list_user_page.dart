import 'dart:async';

import 'package:flutter/material.dart';

import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/list_users_widget.dart';

class ListUserPage extends StatelessWidget {
  final Future<List<UserModel>> userModels;

  const ListUserPage({Key? key, required this.userModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(),
      child: Scaffold(
        appBar: costomAppBar(context),
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

  AppBar costomAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF76B24E),
      leading: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          Navigator.pop(context);
        },
        child: const Center(
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
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
