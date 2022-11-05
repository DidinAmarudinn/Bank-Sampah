// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:bank_sampah/feature/transaction/model/detail_transaction_nasabah_model.dart';

part 'detail_ojek_sampah_model.g.dart';

@JsonSerializable()
class DetailOjekSampahModel {
  @JsonKey(name: "transaksi")
  TransaksiOjekSampah? transaksi;
  @JsonKey(name: "detail_transaksi")
  List<DetailTransaksiOjek>? detailTransaksi;
  @JsonKey(name: "detail_pembayaran")
  List<DataPembayaranNasabah>? detailPembayaran;
  @JsonKey(name: "penilaian")
  PenialaianOjek? penilaian;
  DetailOjekSampahModel(
      {this.detailTransaksi,
      this.transaksi,
      this.detailPembayaran,
      this.penilaian});

  factory DetailOjekSampahModel.fromJson(Map<String, dynamic> json) =>
      _$DetailOjekSampahModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailOjekSampahModelToJson(this);
}

@JsonSerializable()
class TransaksiOjekSampah {
  @JsonKey(name: "id_transaksi")
  String? idTransaksi;
  @JsonKey(name: "id_nasabah")
  String? idNasabah;
  @JsonKey(name: "no_transaksi")
  String? noTransaksi;
  @JsonKey(name: "total_tagihan")
  String? totalTagihan;
  @JsonKey(name: "nominal_transaksi")
  String? nominalTransaksi;
  String? status;
  @JsonKey(name: "nama_nasabah")
  String? namaNasabah;
  @JsonKey(name: "tgl_transaksi")
  String? tglTransaksi;
  @JsonKey(name: "tgl_jatuh_tempo")
  String? tglJatuhTempo;
  String? jenis;
  String? keterangan;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "jml_angkut")
  String? jmlAngkut;
  @JsonKey(name: "total_penugasan")
  int? totalPenugasan;
  @JsonKey(name: "sisa_penugasan")
  int? sisaPenugasan;

  TransaksiOjekSampah({
    this.idTransaksi,
    this.idNasabah,
    this.noTransaksi,
    this.totalTagihan,
    this.nominalTransaksi,
    this.status,
    this.namaNasabah,
    this.tglTransaksi,
    this.tglJatuhTempo,
    this.jenis,
    this.keterangan,
    this.createdAt,
    this.updatedAt,
    this.jmlAngkut,
    this.totalPenugasan,
    this.sisaPenugasan,
  });

  factory TransaksiOjekSampah.fromJson(Map<String, dynamic> json) =>
      _$TransaksiOjekSampahFromJson(json);

  Map<String, dynamic> toJson() => _$TransaksiOjekSampahToJson(this);
}

@JsonSerializable()
class DetailTransaksiOjek {
  String? jenis;
  @JsonKey(name: "detail_alamat")
  String? detailAlamat;
  String? kuantitas;
  String? harga;

  DetailTransaksiOjek({
    this.jenis,
    this.detailAlamat,
    this.kuantitas,
    this.harga,
  });

  factory DetailTransaksiOjek.fromJson(Map<String, dynamic> json) =>
      _$DetailTransaksiOjekFromJson(json);

  Map<String, dynamic> toJson() => _$DetailTransaksiOjekToJson(this);
}

@JsonSerializable()
class PenialaianOjek {
  String? id;
  @JsonKey(name: "id_transaksi")
  String? idTransaksi;
  @JsonKey(name: "id_nasabah")
  String? idNasabah;
  String? nilai;
  String? komentar;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  PenialaianOjek({
    this.id,
    this.idTransaksi,
    this.idNasabah,
    this.nilai,
    this.komentar,
    this.createdAt,
    this.updatedAt,
  });

  factory PenialaianOjek.fromJson(Map<String, dynamic> json) =>
      _$PenialaianOjekFromJson(json);

  Map<String, dynamic> toJson() => _$PenialaianOjekToJson(this);
}
