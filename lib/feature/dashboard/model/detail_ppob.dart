import 'package:json_annotation/json_annotation.dart';

part 'detail_ppob.g.dart';

@JsonSerializable()
class DetailPpob {
  @JsonKey(name: 'jenis_produk')
  String? jenisProduk;
  @JsonKey(name: 'nomor_meter')
  String? nomorMeter;

  DetailPpob({this.jenisProduk, this.nomorMeter});

  factory DetailPpob.fromJson(Map<String, dynamic> json) {
    return _$DetailPpobFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailPpobToJson(this);
}
