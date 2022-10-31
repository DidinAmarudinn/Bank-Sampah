import 'package:json_annotation/json_annotation.dart';

part 'gudang_model.g.dart';

@JsonSerializable()
class GudangModel {
  String? id;
  @JsonKey(name: 'id_user')
  String? idUser;
  @JsonKey(name: 'id_area')
  String? idArea;
  @JsonKey(name: 'nama_gudang')
  String? namaGudang;
  @JsonKey(name: 'kode_gudang')
  String? kodeGudang;
  String? alamat;
  String? keterangan;

  GudangModel({
    this.id,
    this.idUser,
    this.idArea,
    this.namaGudang,
    this.kodeGudang,
    this.alamat,
    this.keterangan,
  });

  factory GudangModel.fromJson(Map<String, dynamic> json) {
    return _$GudangModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GudangModelToJson(this);
}
