class UpdateDataRequest {
  String idJenis;
  String idKecamatan;
  String idKelurahan;
  String namaNasabah;
  String noKontak;
  String email;
  String alamat;
  String statusOjekSampah;
  UpdateDataRequest({
    required this.idJenis,
    required this.idKecamatan,
    required this.idKelurahan,
    required this.namaNasabah,
    required this.noKontak,
    required this.email,
    required this.alamat,
    required this.statusOjekSampah
  });
}