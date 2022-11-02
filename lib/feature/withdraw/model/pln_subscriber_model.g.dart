// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pln_subscriber_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlnSubscriberModel _$PlnSubscriberModelFromJson(Map<String, dynamic> json) =>
    PlnSubscriberModel(
      status: json['status'] as String?,
      hp: json['hp'] as String?,
      meterNo: json['meter_no'] as String?,
      subscriberId: json['subscriber_id'] as String?,
      name: json['name'] as String?,
      segmentPower: json['segment_power'] as String?,
      message: json['message'] as String?,
      rc: json['rc'] as String?,
    );

Map<String, dynamic> _$PlnSubscriberModelToJson(PlnSubscriberModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'hp': instance.hp,
      'meter_no': instance.meterNo,
      'subscriber_id': instance.subscriberId,
      'name': instance.name,
      'segment_power': instance.segmentPower,
      'message': instance.message,
      'rc': instance.rc,
    };
