// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'detail_transaction_nasabah_model.g.dart';

@JsonSerializable()
class DetailTransactionNasabahModel {
  @JsonKey(name: "transaksi")
  TransactionData? transaksi;
  @JsonKey(name: "detail_transaksi")
  List<SampahData>? detailTransaksi;
  @JsonKey(name: "detail_pembayaran")
  List<DataPembayaranNasabah>? detailPembayaran;

  DetailTransactionNasabahModel({
    this.transaksi,
    this.detailTransaksi,
    this.detailPembayaran,
  });
  factory DetailTransactionNasabahModel.fromJson(Map<String, dynamic> json) =>
      _$DetailTransactionNasabahModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailTransactionNasabahModelToJson(this);
}

@JsonSerializable()
class SampahData {
  @JsonKey(name: "id_sampah")
  String? idSampah;
  @JsonKey(name: "kode_sampah")
  String? kodeSampah;
  String? satuan;
  String? kuantitas;
  String? harga;
  SampahData({
    this.idSampah,
    this.kodeSampah,
    this.satuan,
    this.kuantitas,
    this.harga,
  });

  factory SampahData.fromJson(Map<String, dynamic> json) =>
      _$SampahDataFromJson(json);

  Map<String, dynamic> toJson() => _$SampahDataToJson(this);
}

@JsonSerializable()
class TransactionData {
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
  @JsonKey(name: "diskon_pemotongan")
  String? diskonPemotongan;
  @JsonKey(name: "biaya_penambahan")
  String? biayaPenambahan;
  String? keterangan;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  TransactionData({
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
    this.diskonPemotongan,
    this.biayaPenambahan,
    this.keterangan,
    this.createdAt,
    this.updatedAt,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      _$TransactionDataFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionDataToJson(this);
}

@JsonSerializable()
class DataPembayaranNasabah {
  @JsonKey(name: "id_transaksi_pembayaran")
  String? idTransaksiPembayaran;
  String? id;
  String? status;
  @JsonKey(name: "nominal_transaksi")
  String? nominalTransaksi;
  @JsonKey(name: "total_tagihan")
  String? totalTagihan;
  String? jenis;
  @JsonKey(name: "no_transaksi")
  String? noTransaksi;
  String? jumlah;
  @JsonKey(name: "tgl_transaksi")
  String? tglTransaksi;
  @JsonKey(name: "nama_cara")
  String? namaCara;
  DataPembayaranNasabah({
    this.idTransaksiPembayaran,
    this.id,
    this.status,
    this.nominalTransaksi,
    this.totalTagihan,
    this.jenis,
    this.noTransaksi,
    this.jumlah,
    this.tglTransaksi,
    this.namaCara,
  });

  factory DataPembayaranNasabah.fromJson(Map<String, dynamic> json) =>
      _$DataPembayaranNasabahFromJson(json);

  Map<String, dynamic> toJson() => _$DataPembayaranNasabahToJson(this);
}
