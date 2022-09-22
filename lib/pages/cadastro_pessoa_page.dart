import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckerfinder/provider/pessoas_provider.dart';

import '../models/pessoa_models.dart';

class CadastroPessoaPage extends StatefulWidget {
  const CadastroPessoaPage({Key? key}) : super(key: key);

  @override
  State<CadastroPessoaPage> createState() => _CadastroPessoaPageState();
}

class _CadastroPessoaPageState extends State<CadastroPessoaPage> {
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, String>{};
  String? _dropdownValue = 'E';

  bool _isLoading = false;

  final _items = [
    const DropdownMenuItem(value: 'E', child: Text('Empresa')),
    const DropdownMenuItem(value: 'M', child: Text('Motorista')),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if (arg != null) {
        final pessoa = arg as Pessoa;
        _formData['id'] = pessoa.id as String;
        _dropdownValue = pessoa.tipo;
        _formData['nome'] = pessoa.nome;
        _formData['cpfcnpj'] = pessoa.cpfcnpj;
        _formData['cep'] = pessoa.cep;
        _formData['telefone'] = pessoa.telefone;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PessoaProvider>(context, listen: false);

    void dropDownCallback(String? selectedValue) {
      setState(() => {_dropdownValue = selectedValue});
    }

    void submitForm() {
      _formKey.currentState?.save();

      final pessoa = Pessoa(
        id: _formData['id'],
        nome: _formData['nome'] as String,
        tipo: _dropdownValue as String,
        cpfcnpj: _formData['cpfcnpj'] as String,
        cep: _formData['cep'] as String,
        telefone: _formData['telefone'] as String,
      );

      setState(() {
        _isLoading = true;
      });

      provider.save(pessoa).then((value) => {
            setState(() => {_isLoading = false}),
            Navigator.of(context).pop()
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Pessoa'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    SizedBox(
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          label: Text('Tipo Pessoa'),
                        ),
                        items: _items,
                        value: _dropdownValue,
                        onChanged: dropDownCallback,
                      ),
                    ),
                    TextFormField(
                      initialValue: _formData['nome'],
                      decoration: InputDecoration(
                        labelText:
                            _dropdownValue == 'M' ? 'Nome' : 'Razão Social',
                      ),
                      textInputAction: TextInputAction.next,
                      onSaved: (nome) => _formData['nome'] = nome as String,
                    ),
                    TextFormField(
                      initialValue: _formData['cpfcnpj'],
                      decoration: InputDecoration(
                        labelText: _dropdownValue == 'M' ? 'CPF' : 'CNPJ',
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: false),
                      onSaved: (cpfcnpj) =>
                          _formData['cpfcnpj'] = cpfcnpj as String,
                    ),
                    TextFormField(
                      initialValue: _formData['cep'],
                      decoration: const InputDecoration(
                        labelText: 'CEP',
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: false),
                      onSaved: (cep) => _formData['cep'] = cep as String,
                    ),
                    TextFormField(
                      initialValue: _formData['telefone'],
                      decoration: const InputDecoration(
                        labelText: 'Telefone',
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: false),
                      onSaved: (telefone) =>
                          _formData['telefone'] = telefone as String,
                      onFieldSubmitted: (_) => submitForm(),
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          submitForm();
        },
        backgroundColor: Colors.green,
        child: Icon(_formData['id'] == null ? Icons.check : Icons.save),
      ),
    );
  }
}
