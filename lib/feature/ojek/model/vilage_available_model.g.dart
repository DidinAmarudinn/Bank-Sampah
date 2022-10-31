// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vilage_available_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VilageAvailableModel _$VilageAvailableModelFromJson(
        Map<String, dynamic> json) =>
    VilageAvailableModel(
      idKelurahan: json['id_kelurahan'] as String?,
      kelurahan: json['kelurahan'] as String?,
      kecamatan: json['kecamatan'] as String?,
      kabupaten: json['kabupaten'] as String?,
      kodepos: json['kodepos'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$VilageAvailableModelToJson(
        VilageAvailableModel instance) =>
    <String, dynamic>{
      'id_kelurahan': instance.idKelurahan,
      'kelurahan': instance.kelurahan,
      'kecamatan': instance.kecamatan,
      'kabupaten': instance.kabupaten,
      'kodepos': instance.kodepos,
      'text': instance.text,
    };
