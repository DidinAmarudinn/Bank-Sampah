import 'package:json_annotation/json_annotation.dart';

part 'pasca.g.dart';

@JsonSerializable()
class Pasca {
  String? code;
  String? name;
  int? status;
  int? fee;
  int? komisi;
  String? type;
  String? province;

  Pasca({
    this.code,
    this.name,
    this.status,
    this.fee,
    this.komisi,
    this.type,
    this.province,
  });

  factory Pasca.fromJson(Map<String, dynamic> json) => _$PascaFromJson(json);

  Map<String, dynamic> toJson() => _$PascaToJson(this);
}
