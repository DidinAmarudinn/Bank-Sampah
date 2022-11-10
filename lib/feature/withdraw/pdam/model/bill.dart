import 'package:json_annotation/json_annotation.dart';

import 'detail.dart';

part 'bill.g.dart';

@JsonSerializable()
class Bill {
  List<Detail>? detail;

  Bill({this.detail});

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);

  Map<String, dynamic> toJson() => _$BillToJson(this);
}
