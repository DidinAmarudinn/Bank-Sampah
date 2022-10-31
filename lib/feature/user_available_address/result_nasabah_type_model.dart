import 'package:json_annotation/json_annotation.dart';

part 'result_nasabah_type_model.g.dart';

@JsonSerializable()
class ResultNasabahTypeModel {
  final String? id;
  @JsonKey(name: 'id_gudang')
  final String? idGudang;
  @JsonKey(name: 'id_jenis_nasabah')
  final String? idJenisNasabah;
  @JsonKey(name: 'id_user')
  final String? idUser;
  @JsonKey(name: 'id_kecamatan')
  final String? idKecamatan;
  @JsonKey(name: 'id_kelurahan')
  final String? idKelurahan;
  @JsonKey(name: 'harga_hari_ini')
  final String? hargaHariIni;
  @JsonKey(name: 'harga_hari_seterusnya')
  final String? hargaHariSeterusnya;
  @JsonKey(name: 'harga_berlangganan')
  final String? hargaBerlangganan;
  final String? jenis;

  const ResultNasabahTypeModel({
    this.id,
    this.idGudang,
    this.idJenisNasabah,
    this.idUser,
    this.idKecamatan,
    this.idKelurahan,
    this.hargaHariIni,
    this.hargaHariSeterusnya,
    this.hargaBerlangganan,
    this.jenis,
  });

  factory ResultNasabahTypeModel.fromJson(Map<String, dynamic> json) {
    return _$ResultNasabahTypeModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultNasabahTypeModelToJson(this);
}
