import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  String? status;
  @JsonKey(name: 'icon_url')
  String? iconUrl;
  @JsonKey(name: 'pulsa_code')
  String? pulsaCode;
  @JsonKey(name: 'pulsa_op')
  String? pulsaOp;
  @JsonKey(name: 'pulsa_nominal')
  String? pulsaNominal;
  @JsonKey(name: 'pulsa_details')
  String? pulsaDetails;
  @JsonKey(name: 'pulsa_price')
  int? pulsaPrice;
  @JsonKey(name: 'pulsa_type')
  String? pulsaType;
  String? masaaktif;

  Datum({
    this.status,
    this.iconUrl,
    this.pulsaCode,
    this.pulsaOp,
    this.pulsaNominal,
    this.pulsaDetails,
    this.pulsaPrice,
    this.pulsaType,
    this.masaaktif,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
