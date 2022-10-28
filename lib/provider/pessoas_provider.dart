import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/pessoa_models.dart';

class PessoaProvider with ChangeNotifier {
  static const _baseUrl =
      'https://app-findertrucker-default-rtdb.firebaseio.com/';

  final List<Pessoa> _pessoas = [];
  final List<Pessoa> _motoristas = [];

  Future<void> fetchAllPessoas() async {
    _pessoas.clear();
    
    var response = await http.get(Uri.parse('$_baseUrl/pessoas.json'));
    if (response.body == 'null') return;

    final Map<String, dynamic> data = json.decode(response.body);

    for (String key in data.keys) {
      final pessoa = Pessoa.fromJson(data[key]);
      pessoa.id = key;
      _pessoas.add(pessoa);
    }
    
    notifyListeners();
  }

  Future<void> fetchAllMotoristas() async {
    _motoristas.clear();
    var response = await http.get(Uri.parse('$_baseUrl/pessoas.json'));

    if (response.body == 'null') return;

    final Map<String, dynamic> data = json.decode(response.body);

    for (String key in data.keys) {
      final pessoa = Pessoa.fromJson(data[key]);
      pessoa.id = key;
      if (pessoa.tipo == 'M') _motoristas.add(pessoa);
    }

    notifyListeners();
  }

  List<Pessoa> get all => [..._pessoas];
  List<Pessoa> get allMotoristas => [..._motoristas];

  Future<void> save(Pessoa pessoa) async {
    if (pessoa.id == null) {
      await addPessoa(pessoa);
    } else {
      await updatePessoa(pessoa);
    }
  }

  Future<void> addPessoa(Pessoa pessoa) async {
    pessoa.id = '1';
    var response = await http.post(
      Uri.parse("$_baseUrl/pessoas.json"),
      body: json.encode(pessoa.toJson()),
    );
    var id = json.decode(response.body)['name'];
    pessoa.id = id;
    _pessoas.add(pessoa);
    notifyListeners();
  }

  Future<void> deletePessoa(Pessoa pessoa) async {
    int index = _pessoas.indexWhere((p) => p.id == pessoa.id);

    if (index >= 0) {
      _pessoas.removeWhere((p) => p.id == pessoa.id);
      await http.delete(Uri.parse("$_baseUrl/pessoas/${pessoa.id}.json"));
      notifyListeners();
    }
  }

  Future<void> updatePessoa(Pessoa pessoa) async {
    int index = _pessoas.indexWhere((p) => p.id == pessoa.id);

    if (index >= 0) {
      _pessoas[index] = pessoa;
      await http.patch(
        Uri.parse("$_baseUrl/pessoas/${pessoa.id}.json"),
        body: json.encode(
          {
            'nome': pessoa.nome,
            'tipo': pessoa.tipo,
            'cpfcnpj': pessoa.cpfcnpj,
            'cep': pessoa.cep,
            'telefone': pessoa.telefone,
          },
        ),
      );

      notifyListeners();
    }
  }
}
