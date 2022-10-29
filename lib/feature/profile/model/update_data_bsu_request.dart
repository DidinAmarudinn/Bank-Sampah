class UpdateDataBSURequest {
  String idKecamatan;
  String idKelurahan;
  String namaUnit;
  String noKontak;
  String email;
  String alamat;
  String priodeAngkut;
  String tanggalAngkut;
  String hariAngkut;
  String jumlahLK;
  String jumlahPR;
  String ketuaUnit;
  String status;

  UpdateDataBSURequest({
    required this.idKecamatan,
    required this.idKelurahan,
    required this.namaUnit,
    required this.noKontak,
    required this.email,
    required this.alamat,
    required this.priodeAngkut,
    required this.tanggalAngkut,
    required this.hariAngkut,
    required this.jumlahLK,
    required this.jumlahPR,
    required this.ketuaUnit,
    required this.status,
  });
}
