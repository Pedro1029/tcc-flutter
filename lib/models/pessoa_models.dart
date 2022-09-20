class Pessoa {
  final String id;
  final String tipo;
  final String cpfcnpj;
  final String nome;
  String cep;
  String telefone;

  Pessoa({
    required this.id,
    required this.tipo,
    required this.cpfcnpj,
    required this.nome,
    this.cep = '',
    this.telefone = '',
  });
}
