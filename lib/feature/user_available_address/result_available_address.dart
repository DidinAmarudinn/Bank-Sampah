import 'package:json_annotation/json_annotation.dart';

import 'data_buku_alamat.dart';
import 'data_jenis_nasabah.dart';

part 'result_available_address.g.dart';

@JsonSerializable()
class ResultAvaliableAddress {
  @JsonKey(name: 'data_jenis_nasabah')
  DataJenisNasabah? dataJenisNasabah;
  @JsonKey(name: 'data_buku_alamat')
  DataBukuAlamat? dataBukuAlamat;

  ResultAvaliableAddress({this.dataJenisNasabah, this.dataBukuAlamat});

  factory ResultAvaliableAddress.fromJson(Map<String, dynamic> json) {
    return _$ResultAvaliableAddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultAvaliableAddressToJson(this);
}
