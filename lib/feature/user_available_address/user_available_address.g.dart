// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_available_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAvailableAddress _$UserAvailableAddressFromJson(
        Map<String, dynamic> json) =>
    UserAvailableAddress(
      status: json['status'] as String?,
      result: json['result'] == null
          ? null
          : ResultAvaliableAddress.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserAvailableAddressToJson(
        UserAvailableAddress instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
