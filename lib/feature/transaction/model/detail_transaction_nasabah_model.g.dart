// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_transaction_nasabah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailTransactionNasabahModel _$DetailTransactionNasabahModelFromJson(
        Map<String, dynamic> json) =>
    DetailTransactionNasabahModel(
      transaksi: json['transaksi'] == null
          ? null
          : TransactionData.fromJson(json['transaksi'] as Map<String, dynamic>),
      detailTransaksi: (json['detail_transaksi'] as List<dynamic>?)
          ?.map((e) => SampahData.fromJson(e as Map<String, dynamic>))
          .toList(),
      detailPembayaran: (json['detail_pembayaran'] as List<dynamic>?)
          ?.map(
              (e) => DataPembayaranNasabah.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailTransactionNasabahModelToJson(
        DetailTransactionNasabahModel instance) =>
    <String, dynamic>{
      'transaksi': instance.transaksi,
      'detail_transaksi': instance.detailTransaksi,
      'detail_pembayaran': instance.detailPembayaran,
    };

SampahData _$SampahDataFromJson(Map<String, dynamic> json) => SampahData(
      idSampah: json['id_sampah'] as String?,
      kodeSampah: json['kode_sampah'] as String?,
      satuan: json['satuan'] as String?,
      kuantitas: json['kuantitas'] as String?,
      harga: json['harga'] as String?,
    );

Map<String, dynamic> _$SampahDataToJson(SampahData instance) =>
    <String, dynamic>{
      'id_sampah': instance.idSampah,
      'kode_sampah': instance.kodeSampah,
      'satuan': instance.satuan,
      'kuantitas': instance.kuantitas,
      'harga': instance.harga,
    };

TransactionData _$TransactionDataFromJson(Map<String, dynamic> json) =>
    TransactionData(
      idTransaksi: json['id_transaksi'] as String?,
      idNasabah: json['id_nasabah'] as String?,
      noTransaksi: json['no_transaksi'] as String?,
      totalTagihan: json['total_tagihan'] as String?,
      nominalTransaksi: json['nominal_transaksi'] as String?,
      status: json['status'] as String?,
      namaNasabah: json['nama_nasabah'] as String?,
      tglTransaksi: json['tgl_transaksi'] as String?,
      tglJatuhTempo: json['tgl_jatuh_tempo'] as String?,
      jenis: json['jenis'] as String?,
      diskonPemotongan: json['diskon_pemotongan'] as String?,
      biayaPenambahan: json['biaya_penambahan'] as String?,
      keterangan: json['keterangan'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$TransactionDataToJson(TransactionData instance) =>
    <String, dynamic>{
      'id_transaksi': instance.idTransaksi,
      'id_nasabah': instance.idNasabah,
      'no_transaksi': instance.noTransaksi,
      'total_tagihan': instance.totalTagihan,
      'nominal_transaksi': instance.nominalTransaksi,
      'status': instance.status,
      'nama_nasabah': instance.namaNasabah,
      'tgl_transaksi': instance.tglTransaksi,
      'tgl_jatuh_tempo': instance.tglJatuhTempo,
      'jenis': instance.jenis,
      'diskon_pemotongan': instance.diskonPemotongan,
      'biaya_penambahan': instance.biayaPenambahan,
      'keterangan': instance.keterangan,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

DataPembayaranNasabah _$DataPembayaranNasabahFromJson(
        Map<String, dynamic> json) =>
    DataPembayaranNasabah(
      idTransaksiPembayaran: json['id_transaksi_pembayaran'] as String?,
      id: json['id'] as String?,
      status: json['status'] as String?,
      nominalTransaksi: json['nominal_transaksi'] as String?,
      totalTagihan: json['total_tagihan'] as String?,
      jenis: json['jenis'] as String?,
      noTransaksi: json['no_transaksi'] as String?,
      jumlah: json['jumlah'] as String?,
      tglTransaksi: json['tgl_transaksi'] as String?,
      namaCara: json['nama_cara'] as String?,
    );

Map<String, dynamic> _$DataPembayaranNasabahToJson(
        DataPembayaranNasabah instance) =>
    <String, dynamic>{
      'id_transaksi_pembayaran': instance.idTransaksiPembayaran,
      'id': instance.id,
      'status': instance.status,
      'nominal_transaksi': instance.nominalTransaksi,
      'total_tagihan': instance.totalTagihan,
      'jenis': instance.jenis,
      'no_transaksi': instance.noTransaksi,
      'jumlah': instance.jumlah,
      'tgl_transaksi': instance.tglTransaksi,
      'nama_cara': instance.namaCara,
    };
