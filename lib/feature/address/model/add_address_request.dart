class AddAddressRequest {
  final String idKelurahan;
  final String idKecamatan;
  final String namaAlamat;
  final String alamatLengkap;

  AddAddressRequest({
    required this.idKelurahan,
    required this.idKecamatan,
    required this.namaAlamat,
    required this.alamatLengkap,
  });
}
