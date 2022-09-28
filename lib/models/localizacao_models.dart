import 'package:json_annotation/json_annotation.dart';

part 'localizacao_models.g.dart';

@JsonSerializable()
class Localizacao {
  final String adress;
  final double latitude;
  final double longitude;

  Localizacao({
    required this.adress,
    required this.latitude,
    required this.longitude,
  });

  factory Localizacao.fromJson(Map<String, dynamic> json) =>
      _$LocalizacaoFromJson(json);

  Map<String, dynamic> toJson() => _$LocalizacaoToJson(this);
}
