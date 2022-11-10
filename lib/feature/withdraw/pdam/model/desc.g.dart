// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'desc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Desc _$DescFromJson(Map<String, dynamic> json) => Desc(
      billQuantity: json['bill_quantity'] as int?,
      address: json['address'] as String?,
      billerAdmin: json['biller_admin'] as String?,
      pdamName: json['pdam_name'] as String?,
      stampDuty: json['stamp_duty'] as String?,
      dueDate: json['due_date'] as String?,
      kodeTarif: json['kode_tarif'] as String?,
      bill: json['bill'] == null
          ? null
          : Bill.fromJson(json['bill'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DescToJson(Desc instance) => <String, dynamic>{
      'bill_quantity': instance.billQuantity,
      'address': instance.address,
      'biller_admin': instance.billerAdmin,
      'pdam_name': instance.pdamName,
      'stamp_duty': instance.stampDuty,
      'due_date': instance.dueDate,
      'kode_tarif': instance.kodeTarif,
      'bill': instance.bill,
    };
