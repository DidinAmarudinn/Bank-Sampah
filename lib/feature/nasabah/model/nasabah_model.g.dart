// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasabah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NasabahModel _$NasabahModelFromJson(Map<String, dynamic> json) => NasabahModel(
      id: json['id'] as String?,
      idUser: json['id_user'] as String?,
      idArea: json['id_area'] as String?,
      idBsu: json['id_bsu'] as String?,
      idJenis: json['id_jenis'] as String?,
      idUserNasabah: json['id_user_nasabah'] as String?,
      idKecamatan: json['id_kecamatan'] as String?,
      idKelurahan: json['id_kelurahan'] as String?,
      kodeNasabah: json['kode_nasabah'] as String?,
      namaNasabah: json['nama_nasabah'] as String?,
      noKontak: json['no_kontak'] as String?,
      email: json['email'] as String?,
      alamat: json['alamat'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$NasabahModelToJson(NasabahModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.idUser,
      'id_area': instance.idArea,
      'id_bsu': instance.idBsu,
      'id_jenis': instance.idJenis,
      'id_user_nasabah': instance.idUserNasabah,
      'id_kecamatan': instance.idKecamatan,
      'id_kelurahan': instance.idKelurahan,
      'kode_nasabah': instance.kodeNasabah,
      'nama_nasabah': instance.namaNasabah,
      'no_kontak': instance.noKontak,
      'email': instance.email,
      'alamat': instance.alamat,
      'status': instance.status,
    };
