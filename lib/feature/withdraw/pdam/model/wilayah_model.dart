import 'package:json_annotation/json_annotation.dart';

import 'pasca.dart';

part 'wilayah_model.g.dart';

@JsonSerializable()
class WilayahModel {
  List<Pasca>? pasca;

  WilayahModel({this.pasca});

  factory WilayahModel.fromJson(Map<String, dynamic> json) {
    return _$WilayahModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WilayahModelToJson(this);
}
