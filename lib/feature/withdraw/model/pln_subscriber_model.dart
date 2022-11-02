import 'package:json_annotation/json_annotation.dart';

part 'pln_subscriber_model.g.dart';

@JsonSerializable()
class PlnSubscriberModel {
  String? status;
  String? hp;
  @JsonKey(name: 'meter_no')
  String? meterNo;
  @JsonKey(name: 'subscriber_id')
  String? subscriberId;
  String? name;
  @JsonKey(name: 'segment_power')
  String? segmentPower;
  String? message;
  String? rc;

  PlnSubscriberModel({
    this.status,
    this.hp,
    this.meterNo,
    this.subscriberId,
    this.name,
    this.segmentPower,
    this.message,
    this.rc,
  });

  factory PlnSubscriberModel.fromJson(Map<String, dynamic> json) {
    return _$PlnSubscriberModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlnSubscriberModelToJson(this);
}
