// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_buku_alamat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataBukuAlamat _$DataBukuAlamatFromJson(Map<String, dynamic> json) =>
    DataBukuAlamat(
      status: json['status'] as String?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) =>
              ResultAvailableAddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataBukuAlamatToJson(DataBukuAlamat instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
