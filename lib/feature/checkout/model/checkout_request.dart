// ignore_for_file: public_member_api_docs, sort_constructors_first
class CheckoutRequest {
  String transactionDate;
  String transactionEndDate;
  String note;
  String pemotongan;
  String diskonPemotongan;
  String penambahan;
  String biayaPenambahan;
  String totalTagihan;
  List<String> idSampah;
  List<String> kuantitas;
  List<String> harga;
  CheckoutRequest({
    required this.transactionDate,
    required this.transactionEndDate,
    required this.note,
    required this.pemotongan,
    required this.diskonPemotongan,
    required this.penambahan,
    required this.biayaPenambahan,
    required this.totalTagihan,
    required this.idSampah,
    required this.kuantitas,
    required this.harga,
  });
}
