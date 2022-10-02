// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasabah_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NasabahCategoryModel _$NasabahCategoryModelFromJson(
        Map<String, dynamic> json) =>
    NasabahCategoryModel(
      id: json['id'] as String?,
      type: json['jenis'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$NasabahCategoryModelToJson(
        NasabahCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jenis': instance.type,
      'status': instance.status,
    };
