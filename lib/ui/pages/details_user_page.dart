import 'package:flutter/material.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/details_data.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/round_image.dart';

class DetailsUserPage extends StatelessWidget {
  final UserModel userModel;

  const DetailsUserPage({super.key, required this.userModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Details'),
      ),
      body: Center(
        child: Card(
          color: Colors.white60,
          margin: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RoundImage(size: 300),
                const SizedBox(height: 10.0),
                DetailsDataWidget(
                  description: 'Name',
                  fontWeight: true,
                  size: 24,
                  tittle: userModel.name,
                ),
                DetailsDataWidget(
                  description: 'LastName',
                  fontWeight: true,
                  size: 24,
                  tittle: userModel.lastName,
                ),
                DetailsDataWidget(
                  description: 'Birthdate',
                  fontWeight: false,
                  size: 20,
                  tittle: userModel.birthdate,
                ),
                const SizedBox(height: 10.0),
                Text(
                  userModel.address[0],
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
