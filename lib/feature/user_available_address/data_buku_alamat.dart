import 'package:bank_sampah/feature/user_available_address/result_available_address_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_buku_alamat.g.dart';

@JsonSerializable()
class DataBukuAlamat {
  String? status;
  List<ResultAvailableAddressModel>? result;

  DataBukuAlamat({this.status, this.result});

  factory DataBukuAlamat.fromJson(Map<String, dynamic> json) {
    return _$DataBukuAlamatFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DataBukuAlamatToJson(this);
}
