import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckerfinder/utils/app_routes.dart';

import '../models/pessoa_models.dart';
import '../provider/pessoas_provider.dart';

class AppDrawer extends StatelessWidget {
  final Pessoa pessoaSelected;
  const AppDrawer({
    required this.pessoaSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Bem Vindo!'),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Postar Carga'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.CADASTRO_FRETE,
                arguments: pessoaSelected,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Encontrar Motoristas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.ENCONTRAR_MOTORISTAS,
                arguments: pessoaSelected,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.HOME,
              );
            },
          ),
        ],
      ),
    );
  }
}
