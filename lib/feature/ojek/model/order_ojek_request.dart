// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderOjekRequest {
  String idUser;
  String idNasabah;
  String idGudang;
  String tanggalTransaksi;
  String tanggalJatuhTempo;
  String kategoriPenyesuaian;
  String jmlAngkutBerlangganan;
  String keterangan;
  String idKelurahan;
  String idJenisNasabah;
  String idBukuAlamat;
  String detailAlamat;
  String harga;
  OrderOjekRequest({
    required this.idUser,
    required this.idNasabah,
    required this.idGudang,
    required this.tanggalTransaksi,
    required this.tanggalJatuhTempo,
    required this.kategoriPenyesuaian,
    required this.jmlAngkutBerlangganan,
    required this.keterangan,
    required this.idKelurahan,
    required this.idJenisNasabah,
    required this.idBukuAlamat,
    required this.detailAlamat,
    required this.harga,
  });

  OrderOjekRequest copyWith({
    String? idUser,
    String? idNasabah,
    String? idGudang,
    String? tanggalTransaksi,
    String? tanggalJatuhTempo,
    String? kategoriPenyesuaian,
    String? jmlAngkutBerlangganan,
    String? keterangan,
    String? idKelurahan,
    String? idJenisNasabah,
    String? idBukuAlamat,
    String? detailAlamat,
    String? harga,
  }) {
    return OrderOjekRequest(
      idUser: idUser ?? this.idUser,
      idNasabah: idNasabah ?? this.idNasabah,
      idGudang: idGudang ?? this.idGudang,
      tanggalTransaksi: tanggalTransaksi ?? this.tanggalTransaksi,
      tanggalJatuhTempo: tanggalJatuhTempo ?? this.tanggalJatuhTempo,
      kategoriPenyesuaian: kategoriPenyesuaian ?? this.kategoriPenyesuaian,
      jmlAngkutBerlangganan:
          jmlAngkutBerlangganan ?? this.jmlAngkutBerlangganan,
      keterangan: keterangan ?? this.keterangan,
      idKelurahan: idKelurahan ?? this.idKelurahan,
      idJenisNasabah: idJenisNasabah ?? this.idJenisNasabah,
      idBukuAlamat: idBukuAlamat ?? this.idBukuAlamat,
      detailAlamat: detailAlamat ?? this.detailAlamat,
      harga: harga ?? this.harga,
    );
  }
}
