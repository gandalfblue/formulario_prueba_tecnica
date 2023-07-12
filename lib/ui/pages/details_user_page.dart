import 'package:flutter/material.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/appbar.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/details_data.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/round_image.dart';

class DetailsUserPage extends StatelessWidget {
  final UserModel userModel;

  const DetailsUserPage({super.key, required this.userModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.costomAppBar(context, 'User Details'),
      body: SingleChildScrollView(
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
                  tittle: userModel.name.toUpperCase(),
                ),
                DetailsDataWidget(
                  description: 'LastName',
                  fontWeight: true,
                  size: 24,
                  tittle: userModel.lastName.toUpperCase(),
                ),
                DetailsDataWidget(
                  description: 'Birthdate',
                  fontWeight: false,
                  size: 20,
                  tittle: userModel.birthdate,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userModel.address.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DetailsDataWidget(
                          description: 'Address ${index + 1}',
                          fontWeight: false,
                          size: 20,
                          tittle: userModel.address[index],
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
