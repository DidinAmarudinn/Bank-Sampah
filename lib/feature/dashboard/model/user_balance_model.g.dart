// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBalance _$UserBalanceFromJson(Map<String, dynamic> json) => UserBalance(
      status: json['status'] as String?,
      jenis: json['jenis'] as String?,
      result: json['result'] == null
          ? null
          : UserBalanceResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserBalanceToJson(UserBalance instance) =>
    <String, dynamic>{
      'status': instance.status,
      'jenis': instance.jenis,
      'result': instance.result,
    };

UserBalanceResult _$UserBalanceResultFromJson(Map<String, dynamic> json) =>
    UserBalanceResult(
      totalPendapatan: json['total_pendapatan'] as String?,
      sudahDibayar: json['sudah_dibayar'] as String?,
      belumDibayar: json['belum_dibayar'] as String?,
    );

Map<String, dynamic> _$UserBalanceResultToJson(UserBalanceResult instance) =>
    <String, dynamic>{
      'total_pendapatan': instance.totalPendapatan,
      'sudah_dibayar': instance.sudahDibayar,
      'belum_dibayar': instance.belumDibayar,
    };
