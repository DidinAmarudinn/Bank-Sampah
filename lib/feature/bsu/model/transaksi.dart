import 'package:json_annotation/json_annotation.dart';

part 'transaksi.g.dart';

@JsonSerializable()
class Transaksi {
  @JsonKey(name: 'id_transaksi')
  String? idTransaksi;
  @JsonKey(name: 'id_bsu')
  String? idBsu;
  @JsonKey(name: 'no_transaksi')
  String? noTransaksi;
  String? jenis;
  @JsonKey(name: 'nama_gudang')
  String? namaGudang;
  @JsonKey(name: 'total_tagihan')
  String? totalTagihan;
  @JsonKey(name: 'nominal_transaksi')
  String? nominalTransaksi;
  String? status;
  @JsonKey(name: 'tgl_transaksi')
  String? tglTransaksi;
  @JsonKey(name: 'tgl_jatuh_tempo')
  String? tglJatuhTempo;
  String? keterangan;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'id_transaksi_penimbangan')
  String? idTransaksiPenimbangan;

  Transaksi({
    this.idTransaksi,
    this.idBsu,
    this.noTransaksi,
    this.jenis,
    this.namaGudang,
    this.totalTagihan,
    this.nominalTransaksi,
    this.status,
    this.tglTransaksi,
    this.tglJatuhTempo,
    this.keterangan,
    this.createdAt,
    this.updatedAt,
    this.idTransaksiPenimbangan,
  });

  factory Transaksi.fromJson(Map<String, dynamic> json) {
    return _$TransaksiFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransaksiToJson(this);
}
