import 'package:json_annotation/json_annotation.dart';

part 'bsu_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BSUModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "id_user")
  String? idUser;
  @JsonKey(name: "id_area")
  String? idArea;
  @JsonKey(name: "id_bsu")
  String? idBsu;
  @JsonKey(name: "id_jenis")
  String? idJenis;
  @JsonKey(name: "id_user_nasabah")
  String? idUserNasabah;
  @JsonKey(name: "id_kecamatan")
  String? idKecamatan;
  @JsonKey(name: "id_kelurahan")
  String? idKelurahan;
  @JsonKey(name: "kode_nasabah")
  String? kodeNasabah;
  @JsonKey(name: "nama_nasabah")
  String? namaNasabah;
  @JsonKey(name: "no_kontak")
  String? noKontak;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "alamat")
  String? alamat;
  @JsonKey(name: "status")
  String? status;

  BSUModel(
      {this.id,
      this.idUser,
      this.idArea,
      this.idBsu,
      this.idJenis,
      this.idUserNasabah,
      this.idKecamatan,
      this.idKelurahan,
      this.kodeNasabah,
      this.namaNasabah,
      this.noKontak,
      this.email,
      this.alamat,
      this.status});

  factory BSUModel.fromJson(Map<String, dynamic> json) =>
      _$BSUModelFromJson(json);

  Map<String, dynamic> toJson() => _$BSUModelToJson(this);
}
