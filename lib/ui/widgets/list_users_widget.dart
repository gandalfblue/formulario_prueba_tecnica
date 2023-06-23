import 'package:flutter/material.dart';
import 'package:formulario_prueba_tecnica/config/routes/app_routes.dart';
import 'package:formulario_prueba_tecnica/dominio/models/user.dart';
import 'package:formulario_prueba_tecnica/ui/widgets/card_detail_list_user.dart';

class ListUsersWidget extends StatelessWidget {
  const ListUsersWidget({
    super.key,
    required this.listViewUsers,
  });

  final List<UserModel> listViewUsers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: listViewUsers.length,
      itemBuilder: (context, listViewIndex) {
        final user = listViewUsers[listViewIndex];
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.of(context).pushNamed(AppRoutes.home);
                  },
                  child: cardDetailListUser(user: user),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
