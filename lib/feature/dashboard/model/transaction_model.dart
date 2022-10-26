import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
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
  @JsonKey(name: "id_transaksi")
  final String? idTransaksi;
  @JsonKey(name: "no_transaksi")
  final String? noTransaksi;
  @JsonKey(name: "tipe")
  final String? tipe;
  @JsonKey(name: "nominal_transaksi")
  final String? nominalTransaksi;
  @JsonKey(name: "tgl_transaksi")
  final String? tglTransaksi;
  @JsonKey(name: "total_tagihan")
  final String? totalTagihan;
  @JsonKey(name: "status")
  final String? status;

  TransactionResult(
      {this.idTransaksi,
      this.noTransaksi,
      this.tipe,
      this.nominalTransaksi,
      this.tglTransaksi,
      this.totalTagihan,
      this.status});

  factory TransactionResult.fromJson(Map<String, dynamic> json) =>
      _$TransactionResultFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionResultToJson(this);

  String getTransactionType() {
    switch (tipe) {
      case "ojek_sampah":
        return "Ojek Sampah";
      case "pembelian":
        return "Pembelian";
      default:
        return "";
    }
  }

  String getDisplayedDate() {
    var transactionDate =
        DateFormat("yyyy-mm-dd").parse(tglTransaksi ?? "2022-09-01");
    return DateFormat("dd MMMM yyyy","id_ID").format(transactionDate);
  }

  String getPoint() {
    int total = int.parse(totalTagihan ?? "0") - int.parse(nominalTransaksi ?? "0");
    return total.toString();
  }
}
