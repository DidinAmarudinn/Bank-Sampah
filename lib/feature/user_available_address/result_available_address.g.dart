// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_available_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultAvaliableAddress _$ResultAvaliableAddressFromJson(
        Map<String, dynamic> json) =>
    ResultAvaliableAddress(
      dataJenisNasabah: json['data_jenis_nasabah'] == null
          ? null
          : DataJenisNasabah.fromJson(
              json['data_jenis_nasabah'] as Map<String, dynamic>),
      dataBukuAlamat: json['data_buku_alamat'] == null
          ? null
          : DataBukuAlamat.fromJson(
              json['data_buku_alamat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultAvaliableAddressToJson(
        ResultAvaliableAddress instance) =>
    <String, dynamic>{
      'data_jenis_nasabah': instance.dataJenisNasabah,
      'data_buku_alamat': instance.dataBukuAlamat,
    };
