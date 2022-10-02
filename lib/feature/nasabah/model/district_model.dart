import 'package:json_annotation/json_annotation.dart';

part 'district_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DistrictModel {
  @JsonKey(name: 'subdistrict_id')
  String? id;
  @JsonKey(name: 'nama_kecamatan')
  String? districtName;
  @JsonKey(name: "nama_kota")
  String? cityName;
  @JsonKey(name: "type")
  String? type;
  DistrictModel({
    this.id,
    this.districtName,
    this.cityName,
    this.type,
  });
  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictModelToJson(this);
}
