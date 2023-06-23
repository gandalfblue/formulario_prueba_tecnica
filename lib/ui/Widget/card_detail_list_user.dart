import 'package:flutter/material.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/ui/Widget/round_image.dart';

class cardDetailListUser extends StatelessWidget {
  const cardDetailListUser({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            RoundImage(size: 70, image: user.personProfilePhoto),
            infoUser(),
            RoundImage(size: 40),
          ],
        ),
      ),
    );
  }

  Expanded infoUser() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.name),
            Text(user.lastName),
            Text(user.id.toString()),
          ],
        ),
      ),
    );
  }
}
