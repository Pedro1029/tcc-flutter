import 'package:flutter/material.dart';
import 'package:truckerfinder/components/pessoas_list.dart';
import 'package:truckerfinder/models/pessoa_models.dart';
import 'package:truckerfinder/utils/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pessoasex = <Pessoa>[
    Pessoa(
      id: 'p1',
      tipo: 'M',
      cpfcnpj: '098.219.239-84',
      nome: 'Pedro Antonio Santana Alves',
      cep: '88750-000',
      telefone: '(48) 99638-4747',
    ),
    Pessoa(
      id: 'p2',
      tipo: 'E',
      cpfcnpj: '75.249.754/0001-89',
      nome: 'Sophia e Fernando Publicidade e Propaganda ME',
      cep: '88504-413',
      telefone: '(49) 2636-2724',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: PessoasList(pessoas: _pessoasex),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.CADASTRO_PESSOA);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
