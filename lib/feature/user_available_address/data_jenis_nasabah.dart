import 'package:bank_sampah/feature/user_available_address/result_nasabah_type_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'result_available_address.dart';

part 'data_jenis_nasabah.g.dart';

@JsonSerializable()
class DataJenisNasabah {
  String? status;
  List<ResultNasabahTypeModel>? result;

  DataJenisNasabah({this.status, this.result});

  factory DataJenisNasabah.fromJson(Map<String, dynamic> json) {
    return _$DataJenisNasabahFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DataJenisNasabahToJson(this);
}
