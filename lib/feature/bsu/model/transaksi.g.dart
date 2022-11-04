// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaksi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaksi _$TransaksiFromJson(Map<String, dynamic> json) => Transaksi(
      idTransaksi: json['id_transaksi'] as String?,
      idBsu: json['id_bsu'] as String?,
      noTransaksi: json['no_transaksi'] as String?,
      jenis: json['jenis'] as String?,
      namaGudang: json['nama_gudang'] as String?,
      totalTagihan: json['total_tagihan'] as String?,
      nominalTransaksi: json['nominal_transaksi'] as String?,
      status: json['status'] as String?,
      tglTransaksi: json['tgl_transaksi'] as String?,
      tglJatuhTempo: json['tgl_jatuh_tempo'] as String?,
      keterangan: json['keterangan'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      idTransaksiPenimbangan: json['id_transaksi_penimbangan'] as String?,
    );

Map<String, dynamic> _$TransaksiToJson(Transaksi instance) => <String, dynamic>{
      'id_transaksi': instance.idTransaksi,
      'id_bsu': instance.idBsu,
      'no_transaksi': instance.noTransaksi,
      'jenis': instance.jenis,
      'nama_gudang': instance.namaGudang,
      'total_tagihan': instance.totalTagihan,
      'nominal_transaksi': instance.nominalTransaksi,
      'status': instance.status,
      'tgl_transaksi': instance.tglTransaksi,
      'tgl_jatuh_tempo': instance.tglJatuhTempo,
      'keterangan': instance.keterangan,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'id_transaksi_penimbangan': instance.idTransaksiPenimbangan,
    };
