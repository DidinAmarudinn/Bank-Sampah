import 'package:json_annotation/json_annotation.dart';

part 'nasabah_category_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NasabahCategoryModel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'jenis')
  String? type;
  @JsonKey(name: "status")
  String? status;
 
  NasabahCategoryModel({
    this.id,
    this.type,
    this.status
  });
  factory NasabahCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$NasabahCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$NasabahCategoryModelToJson(this);
}
