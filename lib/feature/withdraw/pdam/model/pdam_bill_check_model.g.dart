// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdam_bill_check_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PdamBillCheckModel _$PdamBillCheckModelFromJson(Map<String, dynamic> json) =>
    PdamBillCheckModel(
      trId: json['tr_id'] as int?,
      code: json['code'] as String?,
      datetime: json['datetime'] as String?,
      hp: json['hp'] as String?,
      trName: json['tr_name'] as String?,
      period: json['period'] as String?,
      nominal: json['nominal'] as int?,
      admin: json['admin'] as int?,
      responseCode: json['response_code'] as String?,
      message: json['message'] as String?,
      price: json['price'] as int?,
      sellingPrice: json['selling_price'] as int?,
      balance: json['balance'] as int?,
      noref: json['noref'] as String?,
      refId: json['ref_id'] as String?,
      desc: json['desc'] == null
          ? null
          : Desc.fromJson(json['desc'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PdamBillCheckModelToJson(PdamBillCheckModel instance) =>
    <String, dynamic>{
      'tr_id': instance.trId,
      'code': instance.code,
      'datetime': instance.datetime,
      'hp': instance.hp,
      'tr_name': instance.trName,
      'period': instance.period,
      'nominal': instance.nominal,
      'admin': instance.admin,
      'response_code': instance.responseCode,
      'message': instance.message,
      'price': instance.price,
      'selling_price': instance.sellingPrice,
      'balance': instance.balance,
      'noref': instance.noref,
      'ref_id': instance.refId,
      'desc': instance.desc,
    };
