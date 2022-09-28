import 'package:json_annotation/json_annotation.dart';

import 'localizacao_models.dart';

part 'pessoa_models.g.dart';

@JsonSerializable(explicitToJson: true)
class Pessoa {
  
  String? id;
  final String tipo;
  final String cpfcnpj;
  final String nome;
  String cep;
  String telefone;
  Localizacao location;

  Pessoa({
    this.id,
    required this.tipo,
    required this.cpfcnpj,
    required this.nome,
    this.cep = '',
    this.telefone = '',
    required this.location,
  });

  factory Pessoa.fromJson(Map<String, dynamic> json) => _$PessoaFromJson(json);

  Map<String, dynamic> toJson() => _$PessoaToJson(this);
}
