import 'package:json_annotation/json_annotation.dart';

part 'vilage_available_model.g.dart';

@JsonSerializable()
class VilageAvailableModel {
  @JsonKey(name: 'id_kelurahan')
  final String? idKelurahan;
  final String? kelurahan;
  final String? kecamatan;
  final String? kabupaten;
  final String? kodepos;
  final String? text;

  const VilageAvailableModel({
    this.idKelurahan,
    this.kelurahan,
    this.kecamatan,
    this.kabupaten,
    this.kodepos,
    this.text,
  });

  factory VilageAvailableModel.fromJson(Map<String, dynamic> json) {
    return _$VilageAvailableModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VilageAvailableModelToJson(this);
}
