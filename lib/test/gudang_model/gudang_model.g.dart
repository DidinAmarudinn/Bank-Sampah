// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gudang_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GudangModel _$GudangModelFromJson(Map<String, dynamic> json) => GudangModel(
      id: json['id'] as String?,
      idUser: json['id_user'] as String?,
      idArea: json['id_area'] as String?,
      namaGudang: json['nama_gudang'] as String?,
      kodeGudang: json['kode_gudang'] as String?,
      alamat: json['alamat'] as String?,
      keterangan: json['keterangan'] as String?,
    );

Map<String, dynamic> _$GudangModelToJson(GudangModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.idUser,
      'id_area': instance.idArea,
      'nama_gudang': instance.namaGudang,
      'kode_gudang': instance.kodeGudang,
      'alamat': instance.alamat,
      'keterangan': instance.keterangan,
    };
