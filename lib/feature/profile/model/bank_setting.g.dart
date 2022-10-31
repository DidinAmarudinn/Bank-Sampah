// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankSetting _$BankSettingFromJson(Map<String, dynamic> json) => BankSetting(
      namaBank: json['nama_bank'] as String?,
      cabangBank: json['cabang_bank'] as String?,
      nomorRekening: json['nomor_rekening'] as String?,
      atasNama: json['atas_nama'] as String?,
      tampil: json['tampil'] as String?,
    );

Map<String, dynamic> _$BankSettingToJson(BankSetting instance) =>
    <String, dynamic>{
      'nama_bank': instance.namaBank,
      'cabang_bank': instance.cabangBank,
      'nomor_rekening': instance.nomorRekening,
      'atas_nama': instance.atasNama,
      'tampil': instance.tampil,
    };
