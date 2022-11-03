// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penimbangan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PenimbanganModel _$PenimbanganModelFromJson(Map<String, dynamic> json) =>
    PenimbanganModel(
      idTransaksi: json['id_transaksi'] as String?,
      jenis: json['jenis'] as String?,
      noTransaksi: json['no_transaksi'] as String?,
      namaGudang: json['nama_gudang'] as String?,
      totalTagihan: json['total_tagihan'] as String?,
      nominalTransaksi: json['nominal_transaksi'] as String?,
      status: json['status'] as String?,
      tglTransaksi: json['tgl_transaksi'] as String?,
      tglJatuhTempo: json['tgl_jatuh_tempo'] as String?,
      diskonPemotongan: json['diskon_pemotongan'] as String?,
      biayaPenambahan: json['biaya_penambahan'] as String?,
      keterangan: json['keterangan'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$PenimbanganModelToJson(PenimbanganModel instance) =>
    <String, dynamic>{
      'id_transaksi': instance.idTransaksi,
      'jenis': instance.jenis,
      'no_transaksi': instance.noTransaksi,
      'nama_gudang': instance.namaGudang,
      'total_tagihan': instance.totalTagihan,
      'nominal_transaksi': instance.nominalTransaksi,
      'status': instance.status,
      'tgl_transaksi': instance.tglTransaksi,
      'tgl_jatuh_tempo': instance.tglJatuhTempo,
      'diskon_pemotongan': instance.diskonPemotongan,
      'biaya_penambahan': instance.biayaPenambahan,
      'keterangan': instance.keterangan,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
