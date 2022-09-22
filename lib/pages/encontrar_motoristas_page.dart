import 'package:flutter/material.dart';

import '../components/app_drawer.dart';

class EncontrarMotoristasPage extends StatelessWidget {
  const EncontrarMotoristasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Encontrar Motoristas'),
      ),
    );
  }
}
