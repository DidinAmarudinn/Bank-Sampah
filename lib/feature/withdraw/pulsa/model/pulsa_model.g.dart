// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pulsa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PulsaModel _$PulsaModelFromJson(Map<String, dynamic> json) => PulsaModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PulsaModelToJson(PulsaModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
