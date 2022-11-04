// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_transaction_bsu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailTransactionBsuModel _$DetailTransactionBsuModelFromJson(
        Map<String, dynamic> json) =>
    DetailTransactionBsuModel(
      transaksi: json['transaksi'] == null
          ? null
          : Transaksi.fromJson(json['transaksi'] as Map<String, dynamic>),
      detailTransaksi: (json['detail_transaksi'] as List<dynamic>?)
          ?.map((e) => DetailTransaksi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailTransactionBsuModelToJson(
        DetailTransactionBsuModel instance) =>
    <String, dynamic>{
      'transaksi': instance.transaksi,
      'detail_transaksi': instance.detailTransaksi,
    };
