// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddressModel _$UserAddressModelFromJson(Map<String, dynamic> json) =>
    UserAddressModel(
      id: json['id'] as String?,
      idNasabah: json['id_nasabah'] as String?,
      namaAlamat: json['nama_alamat'] as String?,
      idKecamatan: json['id_kecamatan'] as String?,
      idKelurahan: json['id_kelurahan'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      alamatLengkap: json['alamat_lengkap'] as String?,
      subdistrictName: json['subdistrict_name'] as String?,
      city: json['city'] as String?,
      province: json['province'] as String?,
      type: json['type'] as String?,
      kelurahan: json['kelurahan'] as String?,
      kodepos: json['kodepos'] as String?,
    );

Map<String, dynamic> _$UserAddressModelToJson(UserAddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_nasabah': instance.idNasabah,
      'nama_alamat': instance.namaAlamat,
      'id_kecamatan': instance.idKecamatan,
      'id_kelurahan': instance.idKelurahan,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'alamat_lengkap': instance.alamatLengkap,
      'subdistrict_name': instance.subdistrictName,
      'city': instance.city,
      'province': instance.province,
      'type': instance.type,
      'kelurahan': instance.kelurahan,
      'kodepos': instance.kodepos,
    };
