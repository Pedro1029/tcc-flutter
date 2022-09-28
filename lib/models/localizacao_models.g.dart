// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizacao_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Localizacao _$LocalizacaoFromJson(Map<String, dynamic> json) => Localizacao(
      adress: json['adress'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LocalizacaoToJson(Localizacao instance) =>
    <String, dynamic>{
      'adress': instance.adress,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
