// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_transaksi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailTransaksi _$DetailTransaksiFromJson(Map<String, dynamic> json) =>
    DetailTransaksi(
      idSampah: json['id_sampah'] as String?,
      jenisSampah: json['jenis_sampah'] as String?,
      kodeSampah: json['kode_sampah'] as String?,
      satuan: json['satuan'] as String?,
      harga: json['harga'] as String?,
      kuantitasTimbang: json['kuantitas_timbang'] as String?,
      kuantitasDiterima: json['kuantitas_diterima'] as String?,
      kuantitasTerhitung: json['kuantitas_terhitung'] as String?,
    );

Map<String, dynamic> _$DetailTransaksiToJson(DetailTransaksi instance) =>
    <String, dynamic>{
      'id_sampah': instance.idSampah,
      'jenis_sampah': instance.jenisSampah,
      'kode_sampah': instance.kodeSampah,
      'satuan': instance.satuan,
      'harga': instance.harga,
      'kuantitas_timbang': instance.kuantitasTimbang,
      'kuantitas_diterima': instance.kuantitasDiterima,
      'kuantitas_terhitung': instance.kuantitasTerhitung,
    };
