import 'package:json_annotation/json_annotation.dart';

part 'detail.g.dart';

@JsonSerializable()
class Detail {
  String? period;
  @JsonKey(name: 'first_meter')
  int? firstMeter;
  @JsonKey(name: 'last_meter')
  int? lastMeter;
  int? penalty;
  @JsonKey(name: 'bill_amount')
  int? billAmount;
  @JsonKey(name: 'misc_amount')
  int? miscAmount;
  String? stand;

  Detail({
    this.period,
    this.firstMeter,
    this.lastMeter,
    this.penalty,
    this.billAmount,
    this.miscAmount,
    this.stand,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return _$DetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailToJson(this);
}
