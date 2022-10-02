// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vilage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VilageModel _$VilageModelFromJson(Map<String, dynamic> json) => VilageModel(
      id: json['id'] as String?,
      vilageName: json['kelurahan'] as String?,
      cityName: json['nama_kota'] as String?,
      type: json['type'] as String?,
      postalCode: json['kodepos'] as String?,
    );

Map<String, dynamic> _$VilageModelToJson(VilageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kelurahan': instance.vilageName,
      'nama_kota': instance.cityName,
      'type': instance.type,
      'kodepos': instance.postalCode,
    };
