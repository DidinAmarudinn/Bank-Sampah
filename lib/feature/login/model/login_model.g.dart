// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      id: json['id'] as String?,
      namaUser: json['nama_user'] as String?,
      level: json['level'] as String?,
      status: json['status'] as String?,
      username: json['username'] as String?,
      filefotoprofile: json['filefotoprofile'] as String?,
      idGroup: json['id_group'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_user': instance.namaUser,
      'level': instance.level,
      'status': instance.status,
      'username': instance.username,
      'filefotoprofile': instance.filefotoprofile,
      'id_group': instance.idGroup,
    };
