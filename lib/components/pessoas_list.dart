import 'package:flutter/material.dart';

import '../models/pessoa_models.dart';

class PessoasList extends StatelessWidget {
  final List<Pessoa> pessoas;
  const PessoasList({
    Key? key,
    required this.pessoas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: pessoas.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text('Nenhuma Pessoas Cadastrada'),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: pessoas.length,
              itemBuilder: (ctx, index) {
                final pessoa = pessoas[index];
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 5,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: pessoa.tipo == 'E'
                              ? const Icon(Icons.factory_rounded)
                              : const Icon(Icons.group_rounded),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              pessoa.cpfcnpj,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(pessoa.nome),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
