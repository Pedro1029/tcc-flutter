import 'package:flutter/material.dart';

import '../components/cadastro_pessoa_form.dart';

class CadastroPessoaPage extends StatelessWidget {
  const CadastroPessoaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Pessoa'),
      ),
      body: const CadastroPessoaForm(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.check),
      ),
    );
  }
}
