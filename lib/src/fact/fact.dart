import 'package:json_annotation/json_annotation.dart';

part 'fact.g.dart';

@JsonSerializable()
class Fact {
  final String id;
  final String url;
  final String value;

  @JsonKey(name: 'icon_url')
  final String iconUrl;

  const Fact(this.id, this.iconUrl, this.url, this.value);

  static const fromJsonFactory = _$FactFromJson;

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);
}
