// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wilayah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WilayahModel _$WilayahModelFromJson(Map<String, dynamic> json) => WilayahModel(
      pasca: (json['pasca'] as List<dynamic>?)
          ?.map((e) => Pasca.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WilayahModelToJson(WilayahModel instance) =>
    <String, dynamic>{
      'pasca': instance.pasca,
    };
