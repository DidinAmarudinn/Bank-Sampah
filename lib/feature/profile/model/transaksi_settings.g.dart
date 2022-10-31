// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaksi_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransaksiSettings _$TransaksiSettingsFromJson(Map<String, dynamic> json) =>
    TransaksiSettings(
      selisihJatuhTempo: json['selisih_jatuh_tempo'] as String?,
      jenisSelisih: json['jenis_selisih'] as String?,
      jmlAngkutBerlangganan: json['jml_angkut_berlangganan'] as String?,
      transaksiBerulang: json['transaksi_berulang'] as String?,
    );

Map<String, dynamic> _$TransaksiSettingsToJson(TransaksiSettings instance) =>
    <String, dynamic>{
      'selisih_jatuh_tempo': instance.selisihJatuhTempo,
      'jenis_selisih': instance.jenisSelisih,
      'jml_angkut_berlangganan': instance.jmlAngkutBerlangganan,
      'transaksi_berulang': instance.transaksiBerulang,
    };
