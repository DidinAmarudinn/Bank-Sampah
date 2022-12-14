// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'others_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OthersInfoModel _$OthersInfoModelFromJson(Map<String, dynamic> json) =>
    OthersInfoModel(
      id: json['id'] as String?,
      namaAkun: json['nama_akun'] as String?,
      namaPerusahaan: json['nama_perusahaan'] as String?,
      npwp: json['npwp'] as String?,
      alamat: json['alamat'] as String?,
      noTelp: json['no_telp'] as String?,
      filefotologo: json['filefotologo'] as String?,
      filefotoheader: json['filefotoheader'] as String?,
      filefavicon: json['filefavicon'] as String?,
      tentang: json['tentang'] as String?,
      userEmail: json['user_email'] as String?,
      passEmail: json['pass_email'] as String?,
      userFax: json['user_fax'] as String?,
      kebijakanPrivasi: json['kebijakan_privasi'] as String?,
      syaratKetentuan: json['syarat_ketentuan'] as String?,
      bantuan: json['bantuan'] as String?,
      bankSettings: (json['bank_settings'] as List<dynamic>?)
          ?.map((e) => BankSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      transaksiSettings: json['transaksi_settings'] == null
          ? null
          : TransaksiSettings.fromJson(
              json['transaksi_settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OthersInfoModelToJson(OthersInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_akun': instance.namaAkun,
      'nama_perusahaan': instance.namaPerusahaan,
      'npwp': instance.npwp,
      'alamat': instance.alamat,
      'no_telp': instance.noTelp,
      'filefotologo': instance.filefotologo,
      'filefotoheader': instance.filefotoheader,
      'filefavicon': instance.filefavicon,
      'tentang': instance.tentang,
      'user_email': instance.userEmail,
      'pass_email': instance.passEmail,
      'user_fax': instance.userFax,
      'kebijakan_privasi': instance.kebijakanPrivasi,
      'syarat_ketentuan': instance.syaratKetentuan,
      'bantuan': instance.bantuan,
      'bank_settings': instance.bankSettings,
      'transaksi_settings': instance.transaksiSettings,
    };
