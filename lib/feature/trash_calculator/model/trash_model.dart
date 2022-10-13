import 'package:json_annotation/json_annotation.dart';

part 'trash_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class TrashModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "id_satuan")
  String? idSatuan;
  @JsonKey(name: "id_kategori")
  String? idKategori;
  @JsonKey(name: "id_subkategori")
  String? idSubkategori;
  @JsonKey(name: "kode_sampah")
  String? kodeSampah;
  @JsonKey(name: "jenis_sampah")
  String? jenisSampah;
  @JsonKey(name: "harga_beli_nasabah")
  String? hargaBeliNasabah;
  @JsonKey(name: "harga_beli_unit")
  String? hargaBeliUnit;
  @JsonKey(name: "harga_jual")
  String? hargaJual;
  @JsonKey(name: "filegambar")
  String? filegambar;
  @JsonKey(name: "keterangan")
  String? keterangan;
  @JsonKey(name: "satuan")
  String? satuan;
  @JsonKey(name: "kategori")
  String? kategori;

  TrashModel(
      {this.id,
      this.idSatuan,
      this.idKategori,
      this.idSubkategori,
      this.kodeSampah,
      this.jenisSampah,
      this.hargaBeliNasabah,
      this.hargaBeliUnit,
      this.hargaJual,
      this.filegambar,
      this.keterangan,
      this.satuan,
      this.kategori});

      factory TrashModel.fromJson(Map<String, dynamic> json) =>
      _$TrashModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrashModelToJson(this);
}
