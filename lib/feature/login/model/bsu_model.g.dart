// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bsu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BSUModel _$BSUModelFromJson(Map<String, dynamic> json) => BSUModel(
      id: json['id'] as String?,
      idArea: json['id_area'] as String?,
      idUser: json['id_user'] as String?,
      idUserBsu: json['id_user_bsu'] as String?,
      kodeUnit: json['kode_unit'] as String?,
      namaUnit: json['nama_unit'] as String?,
      ketuaUnit: json['ketua_unit'] as String?,
      noKontak: json['no_kontak'] as String?,
      alamat: json['alamat'] as String?,
      jmlLk: json['jml_lk'] as String?,
      jmlPr: json['jml_pr'] as String?,
      periodeAngkut: json['periode_angkut'] as String?,
      tglAngkut: json['tgl_angkut'] as String?,
      hariAngkut: json['hari_angkut'] as String?,
      idKelurahan: json['id_kelurahan'] as String?,
      idKecamatan: json['id_kecamatan'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$BSUModelToJson(BSUModel instance) => <String, dynamic>{
      'id': instance.id,
      'id_area': instance.idArea,
      'id_user': instance.idUser,
      'id_user_bsu': instance.idUserBsu,
      'kode_unit': instance.kodeUnit,
      'nama_unit': instance.namaUnit,
      'ketua_unit': instance.ketuaUnit,
      'no_kontak': instance.noKontak,
      'alamat': instance.alamat,
      'jml_lk': instance.jmlLk,
      'jml_pr': instance.jmlPr,
      'periode_angkut': instance.periodeAngkut,
      'tgl_angkut': instance.tglAngkut,
      'hari_angkut': instance.hariAngkut,
      'id_kelurahan': instance.idKelurahan,
      'id_kecamatan': instance.idKecamatan,
      'status': instance.status,
    };
