import 'package:intl/intl.dart';

import '../../../utils/formatter_ext.dart';

class TransactionModel {
  String? status;
  String? order;
  String? record;
  String? recordPerPage;
  int? totalRows;
  List<TransactionResult>? result;

  TransactionModel(
      {this.status,
      this.order,
      this.record,
      this.recordPerPage,
      this.totalRows,
      this.result});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    order = json['order'];
    record = json['record'];
    recordPerPage = json['recordPerPage'];
    totalRows = json['total_rows'];
    if (json['result'] != null) {
      result = <TransactionResult>[];
      json['result'].forEach((v) {
        result!.add(TransactionResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['order'] = order;
    data['record'] = record;
    data['recordPerPage'] = recordPerPage;
    data['total_rows'] = totalRows;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TransactionResult {
  String? idTransaksi;
  String? noTransaksi;
  String? tipe;
  String? jenis;
  String? nominalTransaksi;
  String? tglTransaksi;
  String? totalTagihan;
  String? status;
  DetailPpob? detailPpob;
  String? kategoriUser;
  String? inputUser;
  HasilPpobListrik? hasilPpobListrik;
  HasilPpobPDAM? hasilPpobPDAM;
  HasilPpobPulsa? hasilPpobPulsa;
  HasilPpobData? hasilPpobData;
  // String? hasilPpobPenagihan;
  // String? hasilPpobPenimbangan;
  // String? hasilPpobPenugasan;

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
    this.kategoriUser,
    this.inputUser,
    this.hasilPpobListrik,
    this.hasilPpobPDAM,
    this.hasilPpobPulsa,
    this.hasilPpobData,
    // this.hasilPpobPenagihan,
    // this.hasilPpobPenimbangan,
    // this.hasilPpobPenugasan,
  });

  TransactionResult.fromJson(Map<String, dynamic> json) {
    idTransaksi = json['id_transaksi'];
    noTransaksi = json['no_transaksi'];
    tipe = json['tipe'];
    jenis = json['jenis'];
    nominalTransaksi = json['nominal_transaksi'];
    tglTransaksi = json['tgl_transaksi'];
    totalTagihan = json['total_tagihan'];
    status = json['status'];
    detailPpob = json['detail_ppob'] != null
        ? DetailPpob.fromJson(json['detail_ppob'])
        : null;
    kategoriUser = json['kategori_user'];
    inputUser = json['input_user'];
    hasilPpobListrik =
        json['hasil_ppob_listrik'] != null && json['hasil_ppob_listrik'] != ""
            ? HasilPpobListrik.fromJson(json['hasil_ppob_listrik'])
            : null;
    hasilPpobPDAM =
        json['hasil_ppob_PDAM'] != null && json['hasil_ppob_PDAM'] != ""
            ? HasilPpobPDAM.fromJson(json['hasil_ppob_PDAM'])
            : null;
    hasilPpobPulsa =
        json['hasil_ppob_pulsa'] != null && json['hasil_ppob_pulsa'] != ""
            ? HasilPpobPulsa.fromJson(json['hasil_ppob_pulsa'])
            : null;
    hasilPpobData =
        json['hasil_ppob_data'] != null && json['hasil_ppob_data'] != ""
            ? HasilPpobData.fromJson(json['hasil_ppob_data'])
            : null;
    // hasilPpobPenagihan = json['hasil_ppob_penagihan'];
    // hasilPpobPenimbangan = json['hasil_ppob_penimbangan'];
    // hasilPpobPenugasan = json['hasil_ppob_penugasan'];
  }
  String getTransactionType() {
    switch (tipe) {
      case "ojek_sampah":
        return "Jasa Angkut";
      case "pembelian":
        return jenis ?? "";
      case "ppob":
        if (jenis == "listrik") {
          return "${jenis?.toUpperCase() }- ${detailPpob?.jenisProduk?.toUpperCase()}" ;
        }
        if (jenis == "pulsa" || jenis == "data") {
           return "${jenis?.toUpperCase() } ${detailPpob?.operator?.toUpperCase() ?? ""}";
        }
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_transaksi'] = idTransaksi;
    data['no_transaksi'] = noTransaksi;
    data['tipe'] = tipe;
    data['jenis'] = jenis;
    data['nominal_transaksi'] = nominalTransaksi;
    data['tgl_transaksi'] = tglTransaksi;
    data['total_tagihan'] = totalTagihan;
    data['status'] = status;
    if (detailPpob != null) {
      data['detail_ppob'] = detailPpob!.toJson();
    }
    data['kategori_user'] = kategoriUser;
    data['input_user'] = inputUser;
    if (hasilPpobListrik != null) {
      data['hasil_ppob_listrik'] = hasilPpobListrik!.toJson();
    }
    if (hasilPpobPDAM != null) {
      data['hasil_ppob_PDAM'] = hasilPpobPDAM!.toJson();
    }
    if (hasilPpobPulsa != null) {
      data['hasil_ppob_pulsa'] = hasilPpobPulsa!.toJson();
    }
    if (hasilPpobData != null) {
      data['hasil_ppob_data'] = hasilPpobData!.toJson();
    }
    // data['hasil_ppob_penagihan'] = hasilPpobPenagihan;
    // data['hasil_ppob_penimbangan'] = hasilPpobPenimbangan;
    // data['hasil_ppob_penugasan'] = hasilPpobPenugasan;
    return data;
  }
}

class DetailPpob {
  String? jenisProduk;
  String? refIdPostpaid;
  String? nomorRegistrasi;
  String? code;
  String? wilayah;
  String? nomorPelanggan;
  String? pulsaCode;
  String? operator;
  String? nomorTelepon;
  String? nominalPulsa;
  String? nomorMeter;
  String? nominalToken;
  String? nominalData;
  String? hasilPpob;

  DetailPpob(
      {this.jenisProduk,
      this.refIdPostpaid,
      this.nomorRegistrasi,
      this.code,
      this.wilayah,
      this.nomorPelanggan,
      this.pulsaCode,
      this.operator,
      this.nomorTelepon,
      this.nominalPulsa,
      this.nomorMeter,
      this.nominalToken,
      this.nominalData,
      this.hasilPpob});

  DetailPpob.fromJson(Map<String, dynamic> json) {
    jenisProduk = json['jenis_produk'];
    refIdPostpaid = json['ref_id_postpaid'];
    nomorRegistrasi = json['nomor_registrasi'];
    code = json['code'];
    wilayah = json['wilayah'];
    nomorPelanggan = json['nomor_pelanggan'];
    pulsaCode = json['pulsa_code'];
    operator = json['operator'];
    nomorTelepon = json['nomor_telepon'];
    nominalPulsa = json['nominal_pulsa'];
    nomorMeter = json['nomor_meter'];
    nominalToken = json['nominal_token'];
    nominalData = json['nominal_data'];
    hasilPpob = json['hasil_ppob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jenis_produk'] = jenisProduk;
    data['ref_id_postpaid'] = refIdPostpaid;
    data['nomor_registrasi'] = nomorRegistrasi;
    data['code'] = code;
    data['wilayah'] = wilayah;
    data['nomor_pelanggan'] = nomorPelanggan;
    data['pulsa_code'] = pulsaCode;
    data['operator'] = operator;
    data['nomor_telepon'] = nomorTelepon;
    data['nominal_pulsa'] = nominalPulsa;
    data['nomor_meter'] = nomorMeter;
    data['nominal_token'] = nominalToken;
    data['nominal_data'] = nominalData;
    data['hasil_ppob'] = hasilPpob;
    return data;
  }
}

class HasilPpobListrik {
  String? status;
  String? nomorPelanggan;
  String? namaPelanggan;
  int? nominal;
  int? price;
  String? denda;
  String? admin;
  String? periode;
  String? tarif;
  int? daya;
  String? message;
  String? token;
  String? nomorMeter;
  String? nominalToken;

  HasilPpobListrik(
      {this.status,
      this.nomorPelanggan,
      this.namaPelanggan,
      this.nominal,
      this.price,
      this.denda,
      this.admin,
      this.periode,
      this.tarif,
      this.daya,
      this.message,
      this.token,
      this.nomorMeter,
      this.nominalToken});

  HasilPpobListrik.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    nomorPelanggan = json['nomor_pelanggan'];
    namaPelanggan = json['nama_pelanggan'];
    nominal = json['nominal'];
    price = json['price'];
    denda = json['denda'];
    admin = json['admin'];
    periode = json['periode'];
    tarif = json['tarif'];
    daya = json['daya'];
    message = json['message'];
    token = json['token'];
    nomorMeter = json['nomor_meter'];
    nominalToken = json['nominal_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['nomor_pelanggan'] = nomorPelanggan;
    data['nama_pelanggan'] = namaPelanggan;
    data['nominal'] = nominal;
    data['price'] = price;
    data['denda'] = denda;
    data['admin'] = admin;
    data['periode'] = periode;
    data['tarif'] = tarif;
    data['daya'] = daya;
    data['message'] = message;
    data['token'] = token;
    data['nomor_meter'] = nomorMeter;
    data['nominal_token'] = nominalToken;
    return data;
  }
}

class HasilPpobPDAM {
  String? status;
  String? nomorPelanggan;
  String? namaPelanggan;
  String? codeWilayah;
  String? wilayah;
  String? alamat;
  String? namaPdam;
  String? price;
  String? admin;
  String? nominal;
  String? message;
  String? dueDate;
  String? refId;
  String? periode;
  String? firstMeter;
  String? lastMeter;
  String? penalty;

  HasilPpobPDAM(
      {this.status,
      this.nomorPelanggan,
      this.namaPelanggan,
      this.codeWilayah,
      this.wilayah,
      this.alamat,
      this.namaPdam,
      this.price,
      this.admin,
      this.nominal,
      this.message,
      this.dueDate,
      this.refId,
      this.periode,
      this.firstMeter,
      this.lastMeter,
      this.penalty});

  HasilPpobPDAM.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    nomorPelanggan = json['nomor_pelanggan'];
    namaPelanggan = json['nama_pelanggan'];
    codeWilayah = json['code_wilayah'];
    wilayah = json['wilayah'];
    alamat = json['alamat'];
    namaPdam = json['nama_pdam'];
    price = json['price'].toString();
    admin = json['admin'].toString();
    nominal = json['nominal'].toString();
    message = json['message'];
    dueDate = json['due_date'];
    refId = json['ref_id'];
    periode = json['periode'];
    firstMeter = json['first_meter'].toString();
    lastMeter = json['last_meter'].toString();
    penalty = json['penalty'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['nomor_pelanggan'] = nomorPelanggan;
    data['nama_pelanggan'] = namaPelanggan;
    data['code_wilayah'] = codeWilayah;
    data['wilayah'] = wilayah;
    data['alamat'] = alamat;
    data['nama_pdam'] = namaPdam;
    data['price'] = price;
    data['admin'] = admin;
    data['nominal'] = nominal;
    data['message'] = message;
    data['due_date'] = dueDate;
    data['ref_id'] = refId;
    data['periode'] = periode;
    data['first_meter'] = firstMeter;
    data['last_meter'] = lastMeter;
    data['penalty'] = penalty;
    return data;
  }
}

class HasilPpobPulsa {
  String? status;
  String? message;
  String? noHp;
  String? price;
  String? nominalPulsa;
  String? operator;

  HasilPpobPulsa(
      {this.status,
      this.message,
      this.noHp,
      this.price,
      this.nominalPulsa,
      this.operator});

  HasilPpobPulsa.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    noHp = json['no_hp'];
    price = json['price'].toString();
    nominalPulsa = json['nominal_pulsa'];
    operator = json['operator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['no_hp'] = noHp;
    data['price'] = price;
    data['nominal_pulsa'] = nominalPulsa;
    data['operator'] = operator;
    return data;
  }
}

class HasilPpobData {
  String? status;
  String? message;
  String? noHp;
  String? price;
  String? nominalData;
  String? operator;

  HasilPpobData(
      {this.status,
      this.message,
      this.noHp,
      this.price,
      this.nominalData,
      this.operator});

  HasilPpobData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    noHp = json['no_hp'];
    price = json['price'].toString();
    nominalData = json['nominal_data'];
    operator = json['operator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['no_hp'] = noHp;
    data['price'] = price;
    data['nominal_data'] = nominalData;
    data['operator'] = operator;
    return data;
  }
}
