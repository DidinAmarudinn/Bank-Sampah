import 'package:json_annotation/json_annotation.dart';

import 'desc.dart';

part 'pdam_bill_check_model.g.dart';

@JsonSerializable()
class PdamBillCheckModel {
  @JsonKey(name: 'tr_id')
  int? trId;
  String? code;
  String? datetime;
  String? hp;
  @JsonKey(name: 'tr_name')
  String? trName;
  String? period;
  int? nominal;
  int? admin;
  @JsonKey(name: 'response_code')
  String? responseCode;
  String? message;
  int? price;
  @JsonKey(name: 'selling_price')
  int? sellingPrice;
  int? balance;
  String? noref;
  @JsonKey(name: 'ref_id')
  String? refId;
  Desc? desc;

  PdamBillCheckModel({
    this.trId,
    this.code,
    this.datetime,
    this.hp,
    this.trName,
    this.period,
    this.nominal,
    this.admin,
    this.responseCode,
    this.message,
    this.price,
    this.sellingPrice,
    this.balance,
    this.noref,
    this.refId,
    this.desc,
  });

  factory PdamBillCheckModel.fromJson(Map<String, dynamic> json) {
    return _$PdamBillCheckModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PdamBillCheckModelToJson(this);
}
