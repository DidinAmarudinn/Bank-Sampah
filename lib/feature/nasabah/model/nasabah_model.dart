import 'package:json_annotation/json_annotation.dart';
part 'nasabah_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NasabahModel {
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
  @JsonKey(name: "status_ojek_sampah")
  String? statusOjekSampah;

  NasabahModel({
    this.id,
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
    this.statusOjekSampah
  });

   factory NasabahModel.fromJson(Map<String, dynamic> json) =>
      _$NasabahModelFromJson(json);

  Map<String, dynamic> toJson() => _$NasabahModelToJson(this);
}

List<String> dummyNasabahData = [
  "Amayra Samaira Nur Cahya",
  "Aira Naira AZ Zahra",
  "Ainun Githa Syahila Salsabila",
  "Amyra Azrin Haiza Syifa",
  "Azka Pravina Kenza Laila",
  "Azra Renin Laiqa Mehar",
  "Anaya Sanam Rifa Aulia",
  "Angka Sering Jameela Shazma",
  "Annisa Daneem Nuha Irin",
  "Amelia Norhan Nuha Nour"
];
