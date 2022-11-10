import 'package:json_annotation/json_annotation.dart';

import 'bill.dart';

part 'desc.g.dart';

@JsonSerializable()
class Desc {
  @JsonKey(name: 'bill_quantity')
  int? billQuantity;
  String? address;
  @JsonKey(name: 'biller_admin')
  String? billerAdmin;
  @JsonKey(name: 'pdam_name')
  String? pdamName;
  @JsonKey(name: 'stamp_duty')
  String? stampDuty;
  @JsonKey(name: 'due_date')
  String? dueDate;
  @JsonKey(name: 'kode_tarif')
  String? kodeTarif;
  Bill? bill;

  Desc({
    this.billQuantity,
    this.address,
    this.billerAdmin,
    this.pdamName,
    this.stampDuty,
    this.dueDate,
    this.kodeTarif,
    this.bill,
  });

  factory Desc.fromJson(Map<String, dynamic> json) => _$DescFromJson(json);

  Map<String, dynamic> toJson() => _$DescToJson(this);
}
