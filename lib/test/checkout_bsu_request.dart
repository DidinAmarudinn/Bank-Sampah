class CheckoutBSURequest {
  String transactionDate;
  String transactionEndDate;
  String note;
  String totalTagihan;
  List<String> idSampah;
  List<String> kuantitas;
  List<String> harga;
  CheckoutBSURequest({
    required this.transactionDate,
    required this.transactionEndDate,
    required this.note,
    required this.totalTagihan,
    required this.idSampah,
    required this.kuantitas,
    required this.harga,
  });
}
