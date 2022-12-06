// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pasca.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pasca _$PascaFromJson(Map<String, dynamic> json) => Pasca(
      code: json['code'] as String?,
      name: json['name'] as String?,
      status: json['status'] as int?,
      fee: json['fee'] as int?,
      komisi: json['komisi'] as int?,
      type: json['type'] as String?,
      province: json['province'] as String?,
    );

Map<String, dynamic> _$PascaToJson(Pasca instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'status': instance.status,
      'fee': instance.fee,
      'komisi': instance.komisi,
      'type': instance.type,
      'province': instance.province,
    };
