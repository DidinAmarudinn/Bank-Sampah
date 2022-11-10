// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) => Bill(
      detail: (json['detail'] as List<dynamic>?)
          ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'detail': instance.detail,
    };
