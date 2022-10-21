class CompleteProfileRequest {
  String idUserNasabah;
  String idJenis;
  String idKecamatan;
  String idKelurahan;
  String namaNasabah;
  String noKontak;
  String email;
  String alamat;
  String addBukualamat;
  String namaAlamat;
  String statusOjekSampah;
  CompleteProfileRequest({
    required this.idUserNasabah,
    required this.idJenis,
    required this.idKecamatan,
    required this.idKelurahan,
    required this.namaNasabah,
    required this.noKontak,
    required this.email,
    required this.alamat,
    required this.addBukualamat,
    required this.namaAlamat,
    required this.statusOjekSampah
  });
}
