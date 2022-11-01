// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      status: json['status'] as String?,
      order: json['order'] as String?,
      record: json['record'] as String?,
      recordPerPage: json['recordPerPage'] as String?,
      totalRows: json['total_rows'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => TransactionResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'order': instance.order,
      'record': instance.record,
      'recordPerPage': instance.recordPerPage,
      'total_rows': instance.totalRows,
      'result': instance.result,
    };

TransactionResult _$TransactionResultFromJson(Map<String, dynamic> json) =>
    TransactionResult(
      idTransaksi: json['id_transaksi'] as String?,
      noTransaksi: json['no_transaksi'] as String?,
      tipe: json['tipe'] as String?,
      jenis: json['jenis'] as String?,
      nominalTransaksi: json['nominal_transaksi'] as String?,
      tglTransaksi: json['tgl_transaksi'] as String?,
      totalTagihan: json['total_tagihan'] as String?,
      status: json['status'] as String?,
      detailPpob: json['detail_ppob'] == null
          ? null
          : DetailPpob.fromJson(json['detail_ppob'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionResultToJson(TransactionResult instance) =>
    <String, dynamic>{
      'id_transaksi': instance.idTransaksi,
      'no_transaksi': instance.noTransaksi,
      'tipe': instance.tipe,
      'jenis': instance.jenis,
      'nominal_transaksi': instance.nominalTransaksi,
      'tgl_transaksi': instance.tglTransaksi,
      'total_tagihan': instance.totalTagihan,
      'status': instance.status,
      'detail_ppob': instance.detailPpob,
    };
