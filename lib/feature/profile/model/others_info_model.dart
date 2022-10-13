import 'package:json_annotation/json_annotation.dart';

part 'others_info_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class OthersInfoModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "nama_akun")
  String? namaAkun;
  @JsonKey(name: "nama_perusahaan")
  String? namaPerusahaan;
  @JsonKey(name: "npwp")
  String? npwp;
  @JsonKey(name: "alamat")
  String? alamat;
  @JsonKey(name: "no_telp")
  String? noTelp;
  @JsonKey(name: "filefotologo")
  String? filefotologo;
  @JsonKey(name: "filefotoheader")
  String? filefotoheader;
  @JsonKey(name: "filefavicon")
  String? filefavicon;
  @JsonKey(name: "tentang")
  String? tentang;
  @JsonKey(name: "user_email")
  String? userEmail;
  @JsonKey(name: "pass_email")
  String? passEmail;
  @JsonKey(name: "user_fax")
  String? userFax;
  @JsonKey(name: "kebijakan_privasi")
  String? kebijakanPrivasi;
  @JsonKey(name: "bantuan")
  String? bantuan;

  OthersInfoModel(
      {this.id,
      this.namaAkun,
      this.namaPerusahaan,
      this.npwp,
      this.alamat,
      this.noTelp,
      this.filefotologo,
      this.filefotoheader,
      this.filefavicon,
      this.tentang,
      this.userEmail,
      this.passEmail,
      this.userFax,
      this.kebijakanPrivasi,
      this.bantuan});

  factory OthersInfoModel.fromJson(Map<String, dynamic> json) =>
      _$OthersInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$OthersInfoModelToJson(this);
}