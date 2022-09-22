import 'package:json_annotation/json_annotation.dart';

part 'pessoa_models.g.dart';

@JsonSerializable()
class Pessoa {
  String? id;
  final String tipo;
  final String cpfcnpj;
  final String nome;
  String cep;
  String telefone;
  String latitude = '0';
  String longitude = '0';

  Pessoa({
    this.id,
    required this.tipo,
    required this.cpfcnpj,
    required this.nome,
    this.cep = '',
    this.telefone = '',
  });

  factory Pessoa.fromJson(Map<String, dynamic> json) => _$PessoaFromJson(json);

  Map<String, dynamic> toJson() => _$PessoaToJson(this);
}
