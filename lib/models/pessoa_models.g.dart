// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pessoa _$PessoaFromJson(Map<String, dynamic> json) => Pessoa(
      id: json['id'] as String?,
      tipo: json['tipo'] as String,
      cpfcnpj: json['cpfcnpj'] as String,
      nome: json['nome'] as String,
      cep: json['cep'] as String? ?? '',
      telefone: json['telefone'] as String? ?? '',
      location: Localizacao.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PessoaToJson(Pessoa instance) => <String, dynamic>{
      'id': instance.id,
      'tipo': instance.tipo,
      'cpfcnpj': instance.cpfcnpj,
      'nome': instance.nome,
      'cep': instance.cep,
      'telefone': instance.telefone,
      'location': instance.location.toJson(),
    };
