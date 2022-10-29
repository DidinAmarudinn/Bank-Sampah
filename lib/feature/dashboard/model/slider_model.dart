import 'package:json_annotation/json_annotation.dart';
part 'slider_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class SliderModel {
  SliderModel({
    this.id,
    this.menuLocation,
    this.filename,
    this.title,
    this.caption,
    this.url,
    this.active,
    this.posOrder,
    this.tipe,
    this.peruntuk,
    this.pathImage,
  });
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "menu_location")
  final String? menuLocation;
  @JsonKey(name: "filename")
  final String? filename;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "caption")
  final String? caption;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "active")
  final String? active;
  @JsonKey(name: "pos_order")
  final String? posOrder;
  @JsonKey(name: "tipe")
  final String? tipe;
  @JsonKey(name: "peruntuk")
  final String? peruntuk;
  @JsonKey(name: "path_image")
  final String? pathImage;

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SliderModelToJson(this);
}
