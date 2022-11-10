import 'package:json_annotation/json_annotation.dart';

part 'detail_transaksi.g.dart';

@JsonSerializable()
class DetailTransaksi {
  @JsonKey(name: 'id_sampah')
  String? idSampah;
  @JsonKey(name: 'jenis_sampah')
  String? jenisSampah;
  @JsonKey(name: 'kode_sampah')
  String? kodeSampah;
  String? satuan;
  String? harga;
  @JsonKey(name: 'kuantitas_timbang')
  String? kuantitasTimbang;
  @JsonKey(name: "kuantitas_diterima")
  String? kuantitasDiterima;
  @JsonKey(name: "kuantitas_terhitung")
  String? kuantitasTerhitung;

  DetailTransaksi(
      {this.idSampah,
      this.jenisSampah,
      this.kodeSampah,
      this.satuan,
      this.harga,
      this.kuantitasTimbang,
      this.kuantitasDiterima,
      this.kuantitasTerhitung});

  factory DetailTransaksi.fromJson(Map<String, dynamic> json) {
    return _$DetailTransaksiFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailTransaksiToJson(this);
}
