import 'package:json_annotation/json_annotation.dart';

import 'detail_transaksi.dart';
import 'transaksi.dart';

part 'detail_transaction_bsu_model.g.dart';

@JsonSerializable()
class DetailTransactionBsuModel {
  Transaksi? transaksi;
  @JsonKey(name: 'detail_transaksi')
  List<DetailTransaksi>? detailTransaksi;

  DetailTransactionBsuModel({this.transaksi, this.detailTransaksi});

  factory DetailTransactionBsuModel.fromJson(Map<String, dynamic> json) {
    return _$DetailTransactionBsuModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailTransactionBsuModelToJson(this);
}
