import 'dart:async';

import 'package:flutter/material.dart';
import 'package:formulario_prueba_tecnica/config/routes/app_routes.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/ui/Widget/list_users_widget.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({Key? key}) : super(key: key);

  @override
  _ListUserWidgetState createState() => _ListUserWidgetState();
}

class _ListUserWidgetState extends State<ListUserPage> {
  StreamController<List<User>>? miStreamController = StreamController();

  late List<User> listUsers;

  @override
  void initState() {
    super.initState();
    listUsers = [
      User(
          name: 'name',
          lastName: 'lastName',
          id: 1000010000,
          birthdate: DateTime.now(),
          personProfilePhoto:
              'https://cdn.pixabay.com/photo/2018/01/06/09/25/hijab-3064633_1280.jpg',
          address: ['address', 'address']),
      User(
          name: 'name',
          lastName: 'lastName',
          id: 1000010001,
          birthdate: DateTime.now(),
          personProfilePhoto:
              'https://cdn.pixabay.com/photo/2016/03/23/04/01/woman-1274056_1280.jpg',
          address: ['address', 'address']),
      User(
          name: 'name',
          lastName: 'lastName',
          id: 1000010002,
          birthdate: DateTime.now(),
          personProfilePhoto:
              'https://cdn.pixabay.com/photo/2017/05/13/12/40/fashion-2309519_1280.jpg',
          address: ['address', 'address']),
      User(
          name: 'name',
          lastName: 'lastName',
          id: 1000010004,
          birthdate: DateTime.now(),
          personProfilePhoto:
              'https://cdn.pixabay.com/photo/2023/06/03/18/12/benz-8038240_1280.jpg',
          address: ['address', 'address']),
      User(
          name: 'name',
          lastName: 'lastName',
          id: 1000010003,
          birthdate: DateTime.now(),
          personProfilePhoto:
              'https://cdn.pixabay.com/photo/2023/05/09/07/18/space-7980556_1280.jpg',
          address: ['address', 'address']),
      User(
          name: 'name',
          lastName: 'lastName',
          id: 1000010004,
          birthdate: DateTime.now(),
          //personProfilePhoto:'https://cdn.pixabay.com/photo/2023/06/03/18/12/benz-8038240_1280.jpg',
          address: ['address', 'address']),
      User(
          name: 'name',
          lastName: 'lastName',
          id: 1000010000,
          birthdate: DateTime.now(),
          personProfilePhoto:
              'https://cdn.pixabay.com/photo/2018/01/06/09/25/hijab-3064633_1280.jpg',
          address: ['address', 'address']),
      User(
          name: 'name',
          lastName: 'lastName',
          id: 1000010001,
          birthdate: DateTime.now(),
          personProfilePhoto:
              'https://cdn.pixabay.com/photo/2016/03/23/04/01/woman-1274056_1280.jpg',
          address: ['address', 'address']),
      User(
          name: 'name',
          lastName: 'lastName',
          id: 1000010004,
          birthdate: DateTime.now(),
          personProfilePhoto:
              'https://cdn.pixabay.com/photo/2023/06/03/18/12/benz-8038240_1280.jpg',
          address: ['address', 'address']),
      User(
          name: 'name',
          lastName: 'lastName',
          id: 1000010002,
          birthdate: DateTime.now(),
          personProfilePhoto:
              'https://cdn.pixabay.com/photo/2017/05/13/12/40/fashion-2309519_1280.jpg',
          address: ['address', 'address']),
      User(
          name: 'name',
          lastName: 'lastName',
          id: 1000010003,
          birthdate: DateTime.now(),
          personProfilePhoto:
              'https://cdn.pixabay.com/photo/2023/05/09/07/18/space-7980556_1280.jpg',
          address: ['address', 'address']),
      User(
          name: 'name',
          lastName: 'lastName',
          id: 1000010004,
          birthdate: DateTime.now(),
          //personProfilePhoto:'https://cdn.pixabay.com/photo/2023/06/03/18/12/benz-8038240_1280.jpg',
          address: ['address', 'address']),
    ];

    miStreamController!.add(listUsers);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(),
      child: Scaffold(
        appBar: costomAppBar(context),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<User>>(
            stream: miStreamController!.stream,
            initialData: listUsers,
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
              List<User> listViewUsers = snapshot.data!;
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
      title: const Text("Usuarios"),
      titleTextStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      centerTitle: true,
      elevation: 4,
    );
  }
}
