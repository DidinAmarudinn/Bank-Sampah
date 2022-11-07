import 'package:bank_sampah/utils/formatter_ext.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import 'detail_ppob.dart';
part 'transaction_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class TransactionModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "order")
  final String? order;
  @JsonKey(name: "record")
  final String? record;
  @JsonKey(name: "recordPerPage")
  final String? recordPerPage;
  @JsonKey(name: "total_rows")
  final int? totalRows;
  @JsonKey(name: "result")
  final List<TransactionResult>? result;

  TransactionModel(
      {this.status,
      this.order,
      this.record,
      this.recordPerPage,
      this.totalRows,
      this.result});

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}

@JsonSerializable(genericArgumentFactories: true)
class TransactionResult {
  @JsonKey(name: 'id_transaksi')
  String? idTransaksi;
  @JsonKey(name: 'no_transaksi')
  String? noTransaksi;
  String? tipe;
  String? jenis;
  @JsonKey(name: 'nominal_transaksi')
  String? nominalTransaksi;
  @JsonKey(name: 'tgl_transaksi')
  String? tglTransaksi;
  @JsonKey(name: 'total_tagihan')
  String? totalTagihan;
  String? status;
  @JsonKey(name: 'detail_ppob')
  DetailPpob? detailPpob;

  TransactionResult({
    this.idTransaksi,
    this.noTransaksi,
    this.tipe,
    this.jenis,
    this.nominalTransaksi,
    this.tglTransaksi,
    this.totalTagihan,
    this.status,
    this.detailPpob,
  });

  factory TransactionResult.fromJson(Map<String, dynamic> json) =>
      _$TransactionResultFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionResultToJson(this);

  String getTransactionType() {
    switch (tipe) {
      case "ojek_sampah":
        return "Ojek Sampah";
      case "pembelian":
        return jenis ?? "";
      case "ppob":
        return jenis?.toUpperCase() ?? "";
      default:
        return tipe ?? "";
    }
  }

  String getDisplayedDate() {
    var transactionDate =
        DateFormat("yyyy-MM-dd").parse(tglTransaksi ?? "2022-09-01");
    return DateFormat("dd MMMM yyyy", "id_ID").format(transactionDate);
  }

  String getPoint() {
    int total =
        int.parse(totalTagihan ?? "0") - int.parse(nominalTransaksi ?? "0");
    return FormatterExt().currency.format(total);
  }
}
