// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      period: json['period'] as String?,
      firstMeter: json['first_meter'] as int?,
      lastMeter: json['last_meter'] as int?,
      penalty: json['penalty'] as int?,
      billAmount: json['bill_amount'] as int?,
      miscAmount: json['misc_amount'] as int?,
      stand: json['stand'] as String?,
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'period': instance.period,
      'first_meter': instance.firstMeter,
      'last_meter': instance.lastMeter,
      'penalty': instance.penalty,
      'bill_amount': instance.billAmount,
      'misc_amount': instance.miscAmount,
      'stand': instance.stand,
    };
