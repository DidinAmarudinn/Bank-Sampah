import 'package:json_annotation/json_annotation.dart';

part 'penimbangan_model.g.dart';

@JsonSerializable()
class PenimbanganModel {
  @JsonKey(name: 'id_transaksi')
  String? idTransaksi;
  String? jenis;
  @JsonKey(name: 'no_transaksi')
  String? noTransaksi;
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
  @JsonKey(name: 'diskon_pemotongan')
  String? diskonPemotongan;
  @JsonKey(name: 'biaya_penambahan')
  String? biayaPenambahan;
  String? keterangan;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  PenimbanganModel({
    this.idTransaksi,
    this.jenis,
    this.noTransaksi,
    this.namaGudang,
    this.totalTagihan,
    this.nominalTransaksi,
    this.status,
    this.tglTransaksi,
    this.tglJatuhTempo,
    this.diskonPemotongan,
    this.biayaPenambahan,
    this.keterangan,
    this.createdAt,
    this.updatedAt,
  });

  factory PenimbanganModel.fromJson(Map<String, dynamic> json) {
    return _$PenimbanganModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PenimbanganModelToJson(this);
}
