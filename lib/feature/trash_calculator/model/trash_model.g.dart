// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashModel _$TrashModelFromJson(Map<String, dynamic> json) => TrashModel(
      id: json['id'] as String?,
      idSatuan: json['id_satuan'] as String?,
      idKategori: json['id_kategori'] as String?,
      idSubkategori: json['id_subkategori'] as String?,
      kodeSampah: json['kode_sampah'] as String?,
      jenisSampah: json['jenis_sampah'] as String?,
      hargaBeliNasabah: json['harga_beli_nasabah'] as String?,
      hargaBeliUnit: json['harga_beli_unit'] as String?,
      hargaJual: json['harga_jual'] as String?,
      filegambar: json['filegambar'] as String?,
      keterangan: json['keterangan'] as String?,
      satuan: json['satuan'] as String?,
      kategori: json['kategori'] as String?,
    );

Map<String, dynamic> _$TrashModelToJson(TrashModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_satuan': instance.idSatuan,
      'id_kategori': instance.idKategori,
      'id_subkategori': instance.idSubkategori,
      'kode_sampah': instance.kodeSampah,
      'jenis_sampah': instance.jenisSampah,
      'harga_beli_nasabah': instance.hargaBeliNasabah,
      'harga_beli_unit': instance.hargaBeliUnit,
      'harga_jual': instance.hargaJual,
      'filegambar': instance.filegambar,
      'keterangan': instance.keterangan,
      'satuan': instance.satuan,
      'kategori': instance.kategori,
    };
