import 'package:json_annotation/json_annotation.dart';

part 'user_balance_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class UserBalance {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "jenis")
  final String? jenis;
  @JsonKey(name: "result")
  final UserBalanceResult? result;

  UserBalance({this.status, this.jenis, this.result});

  factory UserBalance.fromJson(Map<String, dynamic> json) =>
      _$UserBalanceFromJson(json);

  Map<String, dynamic> toJson() => _$UserBalanceToJson(this);
}

@JsonSerializable(genericArgumentFactories: true)
class UserBalanceResult {
  @JsonKey(name: "total_pendapatan")
  final String? totalPendapatan;
  @JsonKey(name: "sudah_dibayar")
  final String? sudahDibayar;
  @JsonKey(name: "belum_dibayar")
  final String? belumDibayar;

  UserBalanceResult(
      {this.totalPendapatan, this.sudahDibayar, this.belumDibayar});

  factory UserBalanceResult.fromJson(Map<String, dynamic> json) =>
      _$UserBalanceResultFromJson(json);

  Map<String, dynamic> toJson() => _$UserBalanceResultToJson(this);
}
