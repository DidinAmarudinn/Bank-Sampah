import 'package:json_annotation/json_annotation.dart';

part 'result_available_address_model.g.dart';

@JsonSerializable()
class ResultAvailableAddressModel {
  String? id;
  @JsonKey(name: 'id_nasabah')
  String? idNasabah;
  @JsonKey(name: 'nama_alamat')
  String? namaAlamat;
  @JsonKey(name: 'id_kecamatan')
  String? idKecamatan;
  @JsonKey(name: 'id_kelurahan')
  String? idKelurahan;
  String? longitude;
  String? latitude;
  @JsonKey(name: 'alamat_lengkap')
  String? alamatLengkap;
  String? kelurahan;
  String? kecamatan;
  String? kabupaten;
  @JsonKey(name: 'detail_alamat')
  String? detailAlamat;

  ResultAvailableAddressModel({
    this.id,
    this.idNasabah,
    this.namaAlamat,
    this.idKecamatan,
    this.idKelurahan,
    this.longitude,
    this.latitude,
    this.alamatLengkap,
    this.kelurahan,
    this.kecamatan,
    this.kabupaten,
    this.detailAlamat,
  });

  factory ResultAvailableAddressModel.fromJson(Map<String, dynamic> json) {
    return _$ResultAvailableAddressModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultAvailableAddressModelToJson(this);
}
