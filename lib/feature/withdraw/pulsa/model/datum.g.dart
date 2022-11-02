// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      status: json['status'] as String?,
      iconUrl: json['icon_url'] as String?,
      pulsaCode: json['pulsa_code'] as String?,
      pulsaOp: json['pulsa_op'] as String?,
      pulsaNominal: json['pulsa_nominal'] as String?,
      pulsaDetails: json['pulsa_details'] as String?,
      pulsaPrice: json['pulsa_price'] as int?,
      pulsaType: json['pulsa_type'] as String?,
      masaaktif: json['masaaktif'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'status': instance.status,
      'icon_url': instance.iconUrl,
      'pulsa_code': instance.pulsaCode,
      'pulsa_op': instance.pulsaOp,
      'pulsa_nominal': instance.pulsaNominal,
      'pulsa_details': instance.pulsaDetails,
      'pulsa_price': instance.pulsaPrice,
      'pulsa_type': instance.pulsaType,
      'masaaktif': instance.masaaktif,
    };
