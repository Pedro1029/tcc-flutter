import 'package:flutter/material.dart';
import 'package:truckerfinder/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

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
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Encontrar Motoristas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.ENCONTRAR_MOTORISTAS,
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
