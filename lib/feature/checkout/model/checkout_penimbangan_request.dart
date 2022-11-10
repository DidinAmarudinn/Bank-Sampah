// ignore_for_file: public_member_api_docs, sort_constructors_first
class CheckoutPenimbanganRequest {
  String tglTransaksi;
  String tglJatuhTempo;
  String? keterangan;
  String totalTagihan;
  String idGudang;
  List<String> idsSampah;
  List<String> kuantitasTimbang;
  List<String> harga;
  CheckoutPenimbanganRequest({
    required this.tglTransaksi,
    required this.idGudang,
    required this.tglJatuhTempo,
    required this.keterangan,
    required this.totalTagihan,
    required this.idsSampah,
    required this.kuantitasTimbang,
    required this.harga,
  });
}
