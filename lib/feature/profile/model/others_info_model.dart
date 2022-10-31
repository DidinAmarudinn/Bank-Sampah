import 'package:json_annotation/json_annotation.dart';

import 'bank_setting.dart';
import 'transaksi_settings.dart';

part 'others_info_model.g.dart';

@JsonSerializable()
class OthersInfoModel {
  String? id;
  @JsonKey(name: 'nama_akun')
  String? namaAkun;
  @JsonKey(name: 'nama_perusahaan')
  String? namaPerusahaan;
  String? npwp;
  String? alamat;
  @JsonKey(name: 'no_telp')
  String? noTelp;
  String? filefotologo;
  String? filefotoheader;
  String? filefavicon;
  String? tentang;
  @JsonKey(name: 'user_email')
  String? userEmail;
  @JsonKey(name: 'pass_email')
  String? passEmail;
  @JsonKey(name: 'user_fax')
  String? userFax;
  @JsonKey(name: 'kebijakan_privasi')
  String? kebijakanPrivasi;
  @JsonKey(name: 'syarat_ketentuan')
  String? syaratKetentuan;
  String? bantuan;
  @JsonKey(name: 'bank_settings')
  List<BankSetting>? bankSettings;
  @JsonKey(name: 'transaksi_settings')
  TransaksiSettings? transaksiSettings;

  OthersInfoModel({
    this.id,
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
    this.syaratKetentuan,
    this.bantuan,
    this.bankSettings,
    this.transaksiSettings,
  });

  factory OthersInfoModel.fromJson(Map<String, dynamic> json) {
    return _$OthersInfoModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OthersInfoModelToJson(this);
}
