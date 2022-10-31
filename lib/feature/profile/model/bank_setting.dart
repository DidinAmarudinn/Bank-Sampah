import 'package:json_annotation/json_annotation.dart';

part 'bank_setting.g.dart';

@JsonSerializable()
class BankSetting {
  @JsonKey(name: 'nama_bank')
  String? namaBank;
  @JsonKey(name: 'cabang_bank')
  String? cabangBank;
  @JsonKey(name: 'nomor_rekening')
  String? nomorRekening;
  @JsonKey(name: 'atas_nama')
  String? atasNama;
  String? tampil;

  BankSetting({
    this.namaBank,
    this.cabangBank,
    this.nomorRekening,
    this.atasNama,
    this.tampil,
  });

  factory BankSetting.fromJson(Map<String, dynamic> json) {
    return _$BankSettingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BankSettingToJson(this);
}
