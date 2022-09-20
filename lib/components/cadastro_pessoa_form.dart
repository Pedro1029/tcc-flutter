import 'package:flutter/material.dart';

class CadastroPessoaForm extends StatefulWidget {
  const CadastroPessoaForm({Key? key}) : super(key: key);

  @override
  State<CadastroPessoaForm> createState() => _CadastroPessoaFormState();
}

class _CadastroPessoaFormState extends State<CadastroPessoaForm> {
  String? _dropdownValue = 'E';

  final _items = [
    const DropdownMenuItem(value: 'E', child: Text('Empresa')),
    const DropdownMenuItem(value: 'M', child: Text('Motorista')),
  ];

  void dropDownCallback(String? selectedValue) {
    setState(() => {_dropdownValue = selectedValue});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  label: Text('Tipo Pessoa'),
                ),
                items: _items,
                value: _dropdownValue,
                onChanged: dropDownCallback,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: (_dropdownValue == 'M' ? 'Nome' : 'Razão Social'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: false),
              decoration: InputDecoration(
                labelText: (_dropdownValue == 'M' ? 'CPF' : 'CNPJ'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: false),
              decoration: InputDecoration(
                labelText: 'CEP',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
