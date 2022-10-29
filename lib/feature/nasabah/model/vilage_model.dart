import 'package:json_annotation/json_annotation.dart';

part 'vilage_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class VilageModel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'kelurahan')
  String? vilageName;
  @JsonKey(name: "nama_kota")
  String? cityName;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "kodepos")
  String? postalCode;
  VilageModel(
      {this.id, this.vilageName, this.cityName, this.type, this.postalCode});
  factory VilageModel.fromJson(Map<String, dynamic> json) =>
      _$VilageModelFromJson(json);

  Map<String, dynamic> toJson() => _$VilageModelToJson(this);
}
