// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderModel _$SliderModelFromJson(Map<String, dynamic> json) => SliderModel(
      id: json['id'] as String?,
      menuLocation: json['menu_location'] as String?,
      filename: json['filename'] as String?,
      title: json['title'] as String?,
      caption: json['caption'] as String?,
      url: json['url'] as String?,
      active: json['active'] as String?,
      posOrder: json['pos_order'] as String?,
      tipe: json['tipe'] as String?,
      peruntuk: json['peruntuk'] as String?,
      pathImage: json['path_image'] as String?,
    );

Map<String, dynamic> _$SliderModelToJson(SliderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'menu_location': instance.menuLocation,
      'filename': instance.filename,
      'title': instance.title,
      'caption': instance.caption,
      'url': instance.url,
      'active': instance.active,
      'pos_order': instance.posOrder,
      'tipe': instance.tipe,
      'peruntuk': instance.peruntuk,
      'path_image': instance.pathImage,
    };
