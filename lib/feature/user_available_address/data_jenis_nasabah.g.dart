// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_jenis_nasabah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataJenisNasabah _$DataJenisNasabahFromJson(Map<String, dynamic> json) =>
    DataJenisNasabah(
      status: json['status'] as String?,
      result: (json['result'] as List<dynamic>?)
          ?.map(
              (e) => ResultNasabahTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataJenisNasabahToJson(DataJenisNasabah instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
