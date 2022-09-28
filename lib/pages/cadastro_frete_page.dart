import 'package:flutter/material.dart';
import 'package:truckerfinder/models/pessoa_models.dart';

import '../components/app_drawer.dart';

class CadastroFretePage extends StatelessWidget {
  const CadastroFretePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
          pessoaSelected: ModalRoute.of(context)?.settings.arguments as Pessoa),
      appBar: AppBar(
        title: const Text('Cadastro Carga'),
      ),
    );
  }
}
