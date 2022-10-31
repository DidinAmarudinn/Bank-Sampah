// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_available_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultAvailableAddressModel _$ResultAvailableAddressModelFromJson(
        Map<String, dynamic> json) =>
    ResultAvailableAddressModel(
      id: json['id'] as String?,
      idNasabah: json['id_nasabah'] as String?,
      namaAlamat: json['nama_alamat'] as String?,
      idKecamatan: json['id_kecamatan'] as String?,
      idKelurahan: json['id_kelurahan'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      alamatLengkap: json['alamat_lengkap'] as String?,
      kelurahan: json['kelurahan'] as String?,
      kecamatan: json['kecamatan'] as String?,
      kabupaten: json['kabupaten'] as String?,
      detailAlamat: json['detail_alamat'] as String?,
    );

Map<String, dynamic> _$ResultAvailableAddressModelToJson(
        ResultAvailableAddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_nasabah': instance.idNasabah,
      'nama_alamat': instance.namaAlamat,
      'id_kecamatan': instance.idKecamatan,
      'id_kelurahan': instance.idKelurahan,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'alamat_lengkap': instance.alamatLengkap,
      'kelurahan': instance.kelurahan,
      'kecamatan': instance.kecamatan,
      'kabupaten': instance.kabupaten,
      'detail_alamat': instance.detailAlamat,
    };
