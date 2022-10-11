import 'package:json_annotation/json_annotation.dart';

part 'nasabah_bsu_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NasabahBSUModel {
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
  @JsonKey(name: "nama_area")
  String? namaArea;
  @JsonKey(name: "kode_area")
  String? kodeArea;
  @JsonKey(name: "subdistrict_name")
  String? subdistrictName;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "province")
  String? province;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "kelurahan")
  String? kelurahan;
  @JsonKey(name: "kodepos")
  String? kodepos;
  @JsonKey(name: "nama_unit")
  String? namaUnit;
  @JsonKey(name: "kode_unit")
  String? kodeUnit;
  @JsonKey(name: "jenis")
  String? jenis;

  NasabahBSUModel(
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
      this.status,
      this.namaArea,
      this.kodeArea,
      this.subdistrictName,
      this.city,
      this.province,
      this.type,
      this.kelurahan,
      this.kodepos,
      this.namaUnit,
      this.kodeUnit,
      this.jenis});
    
    factory NasabahBSUModel.fromJson(Map<String, dynamic> json) =>
      _$NasabahBSUModelFromJson(json);

  Map<String, dynamic> toJson() => _$NasabahBSUModelToJson(this);
}
