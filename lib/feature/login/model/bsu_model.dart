import 'package:json_annotation/json_annotation.dart';

part 'bsu_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BSUModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "id_area")
  String? idArea;
  @JsonKey(name: "id_user")
  String? idUser;
  @JsonKey(name: "id_user_bsu")
  String? idUserBsu;
  @JsonKey(name: "kode_unit")
  String? kodeUnit;
  @JsonKey(name: "nama_unit")
  String? namaUnit;
  @JsonKey(name: "ketua_unit")
  String? ketuaUnit;
  @JsonKey(name: "no_kontak")
  String? noKontak;
  @JsonKey(name: "alamat")
  String? alamat;
  @JsonKey(name: "jml_lk")
  String? jmlLk;
  @JsonKey(name: "jml_pr")
  String? jmlPr;
  @JsonKey(name: "periode_angkut")
  String? periodeAngkut;
  @JsonKey(name: "tgl_angkut")
  String? tglAngkut;
  @JsonKey(name: "hari_angkut")
  String? hariAngkut;
  @JsonKey(name: "id_kelurahan")
  String? idKelurahan;
  @JsonKey(name: "id_kecamatan")
  String? idKecamatan;
  @JsonKey(name: "status")
  String? status;

  BSUModel(
      {this.id,
      this.idArea,
      this.idUser,
      this.idUserBsu,
      this.kodeUnit,
      this.namaUnit,
      this.ketuaUnit,
      this.noKontak,
      this.alamat,
      this.jmlLk,
      this.jmlPr,
      this.periodeAngkut,
      this.tglAngkut,
      this.hariAngkut,
      this.idKelurahan,
      this.idKecamatan,
      this.status});

  factory BSUModel.fromJson(Map<String, dynamic> json) =>
      _$BSUModelFromJson(json);

  Map<String, dynamic> toJson() => _$BSUModelToJson(this);
}
