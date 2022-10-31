// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_nasabah_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultNasabahTypeModel _$ResultNasabahTypeModelFromJson(
        Map<String, dynamic> json) =>
    ResultNasabahTypeModel(
      id: json['id'] as String?,
      idGudang: json['id_gudang'] as String?,
      idJenisNasabah: json['id_jenis_nasabah'] as String?,
      idUser: json['id_user'] as String?,
      idKecamatan: json['id_kecamatan'] as String?,
      idKelurahan: json['id_kelurahan'] as String?,
      hargaHariIni: json['harga_hari_ini'] as String?,
      hargaHariSeterusnya: json['harga_hari_seterusnya'] as String?,
      hargaBerlangganan: json['harga_berlangganan'] as String?,
      jenis: json['jenis'] as String?,
    );

Map<String, dynamic> _$ResultNasabahTypeModelToJson(
        ResultNasabahTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_gudang': instance.idGudang,
      'id_jenis_nasabah': instance.idJenisNasabah,
      'id_user': instance.idUser,
      'id_kecamatan': instance.idKecamatan,
      'id_kelurahan': instance.idKelurahan,
      'harga_hari_ini': instance.hargaHariIni,
      'harga_hari_seterusnya': instance.hargaHariSeterusnya,
      'harga_berlangganan': instance.hargaBerlangganan,
      'jenis': instance.jenis,
    };
