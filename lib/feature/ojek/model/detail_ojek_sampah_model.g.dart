// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_ojek_sampah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailOjekSampahModel _$DetailOjekSampahModelFromJson(
        Map<String, dynamic> json) =>
    DetailOjekSampahModel(
      detailTransaksi: (json['detail_transaksi'] as List<dynamic>?)
          ?.map((e) => DetailTransaksiOjek.fromJson(e as Map<String, dynamic>))
          .toList(),
      transaksi: json['transaksi'] == null
          ? null
          : TransaksiOjekSampah.fromJson(
              json['transaksi'] as Map<String, dynamic>),
      detailPembayaran: (json['detail_pembayaran'] as List<dynamic>?)
          ?.map(
              (e) => DataPembayaranNasabah.fromJson(e as Map<String, dynamic>))
          .toList(),
      penilaian: json['penilaian'] == null
          ? null
          : PenialaianOjek.fromJson(json['penilaian'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailOjekSampahModelToJson(
        DetailOjekSampahModel instance) =>
    <String, dynamic>{
      'transaksi': instance.transaksi,
      'detail_transaksi': instance.detailTransaksi,
      'detail_pembayaran': instance.detailPembayaran,
      'penilaian': instance.penilaian,
    };

TransaksiOjekSampah _$TransaksiOjekSampahFromJson(Map<String, dynamic> json) =>
    TransaksiOjekSampah(
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
      keterangan: json['keterangan'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      jmlAngkut: json['jml_angkut'] as String?,
      totalPenugasan: json['total_penugasan'] as int?,
      sisaPenugasan: json['sisa_penugasan'] as int?,
    );

Map<String, dynamic> _$TransaksiOjekSampahToJson(
        TransaksiOjekSampah instance) =>
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
      'keterangan': instance.keterangan,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'jml_angkut': instance.jmlAngkut,
      'total_penugasan': instance.totalPenugasan,
      'sisa_penugasan': instance.sisaPenugasan,
    };

DetailTransaksiOjek _$DetailTransaksiOjekFromJson(Map<String, dynamic> json) =>
    DetailTransaksiOjek(
      jenis: json['jenis'] as String?,
      detailAlamat: json['detail_alamat'] as String?,
      kuantitas: json['kuantitas'] as String?,
      harga: json['harga'] as String?,
    );

Map<String, dynamic> _$DetailTransaksiOjekToJson(
        DetailTransaksiOjek instance) =>
    <String, dynamic>{
      'jenis': instance.jenis,
      'detail_alamat': instance.detailAlamat,
      'kuantitas': instance.kuantitas,
      'harga': instance.harga,
    };

PenialaianOjek _$PenialaianOjekFromJson(Map<String, dynamic> json) =>
    PenialaianOjek(
      id: json['id'] as String?,
      idTransaksi: json['id_transaksi'] as String?,
      idNasabah: json['id_nasabah'] as String?,
      nilai: json['nilai'] as String?,
      komentar: json['komentar'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$PenialaianOjekToJson(PenialaianOjek instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_transaksi': instance.idTransaksi,
      'id_nasabah': instance.idNasabah,
      'nilai': instance.nilai,
      'komentar': instance.komentar,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
