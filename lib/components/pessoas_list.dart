import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pessoa_models.dart';
import '../provider/pessoas_provider.dart';
import '../utils/app_routes.dart';

class PessoasList extends StatelessWidget {
  final List<Pessoa> pessoas;
  // ignore: use_key_in_widget_constructors
  const PessoasList(this.pessoas);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PessoaProvider>(context, listen: false);

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: pessoas.length,
        itemBuilder: (ctx, index) {
          final pessoa = pessoas[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.MAIN_PAGE,
                arguments: pessoa,
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(pessoa.tipo == 'E'
                    ? Icons.factory_rounded
                    : Icons.group_rounded),
              ),
              title: Text(
                pessoa.cpfcnpj,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(pessoa.nome),
              trailing: SizedBox(
                width: 100,
                child: Row(children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.CADASTRO_PESSOA,
                        arguments: pessoa,
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.amber,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      provider.deletePessoa(pessoa);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
