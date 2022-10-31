import 'package:json_annotation/json_annotation.dart';

part 'transaksi_settings.g.dart';

@JsonSerializable()
class TransaksiSettings {
  @JsonKey(name: 'selisih_jatuh_tempo')
  String? selisihJatuhTempo;
  @JsonKey(name: 'jenis_selisih')
  String? jenisSelisih;
  @JsonKey(name: 'jml_angkut_berlangganan')
  String? jmlAngkutBerlangganan;
  @JsonKey(name: 'transaksi_berulang')
  String? transaksiBerulang;

  TransaksiSettings({
    this.selisihJatuhTempo,
    this.jenisSelisih,
    this.jmlAngkutBerlangganan,
    this.transaksiBerulang,
  });

  factory TransaksiSettings.fromJson(Map<String, dynamic> json) {
    return _$TransaksiSettingsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransaksiSettingsToJson(this);
}
