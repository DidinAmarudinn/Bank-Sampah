import 'package:json_annotation/json_annotation.dart';

part 'user_address_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class UserAddressModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "id_nasabah")
  String? idNasabah;
  @JsonKey(name: "nama_alamat")
  String? namaAlamat;
  @JsonKey(name: "id_kecamatan")
  String? idKecamatan;
  @JsonKey(name: "id_kelurahan")
  String? idKelurahan;
  @JsonKey(name: "longitude")
  String? longitude;
  @JsonKey(name: "latitude")
  String? latitude;
  @JsonKey(name: "alamat_lengkap")
  String? alamatLengkap;
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

  UserAddressModel(
      {this.id,
      this.idNasabah,
      this.namaAlamat,
      this.idKecamatan,
      this.idKelurahan,
      this.longitude,
      this.latitude,
      this.alamatLengkap,
      this.subdistrictName,
      this.city,
      this.province,
      this.type,
      this.kelurahan,
      this.kodepos});

  factory UserAddressModel.fromJson(Map<String, dynamic> json) =>
      _$UserAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressModelToJson(this);
}
