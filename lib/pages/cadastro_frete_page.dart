import 'package:flutter/material.dart';

import '../components/app_drawer.dart';

class CadastroFretePage extends StatelessWidget {
  const CadastroFretePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Cadastro Carga'),
      ),
    );
  }
}
