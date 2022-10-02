// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictModel _$DistrictModelFromJson(Map<String, dynamic> json) =>
    DistrictModel(
      id: json['subdistrict_id'] as String?,
      districtName: json['nama_kecamatan'] as String?,
      cityName: json['nama_kota'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$DistrictModelToJson(DistrictModel instance) =>
    <String, dynamic>{
      'subdistrict_id': instance.id,
      'nama_kecamatan': instance.districtName,
      'nama_kota': instance.cityName,
      'type': instance.type,
    };
