import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/checkout/model/checkout_penimbangan_request.dart';
import 'package:bank_sampah/feature/checkout/model/checkout_request.dart';
import 'package:dartz/dartz.dart';

import '../../../utils/api_constants.dart';
import '../../../utils/exception.dart';
import '../../../utils/failure.dart';
import 'package:http/http.dart' as http;

class CheckoutService {
  Future<Either<Failure, bool>> checkout(
      CheckoutRequest checkoutRequest, String idBSU, String idNasabah) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(checkoutUrl));
      Map<String, String> body = {
        'id_user': idBSU,
        'id_nasabah': idNasabah,
        'tgl_transaksi': checkoutRequest.transactionDate,
        'tgl_jatuh_tempo': checkoutRequest.transactionEndDate,
        'keterangan': checkoutRequest.note,
        'pemotongan': checkoutRequest.pemotongan,
        'diskon_pemotongan': checkoutRequest.diskonPemotongan,
        'penambahan': checkoutRequest.penambahan,
        'biaya_penambahan': checkoutRequest.biayaPenambahan,
        'total_tagihan': checkoutRequest.totalTagihan,
      };

      checkoutRequest.harga.asMap().forEach((key, value) {
        body["harga[$key]"] = value;
      });
      checkoutRequest.kuantitas.asMap().forEach((key, value) {
        body["kuantitas[$key]"] = value;
      });
      checkoutRequest.idSampah.asMap().forEach((key, value) {
        body["id_sampah[$key]"] = value;
      });
      request.fields.addAll(body);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        if (res["status"] == "true") {
          return const Right(true);
        } else {
          return Left(ServerFailure(res["result"].toString()));
        }
      } else {
        throw ServerException();
      }
    } on ServerException {
      return Left(ServerFailure("Internal Server Error"));
    } on SocketException {
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  Future<Either<Failure, bool>> checkoutPenimbangan(
      CheckoutPenimbanganRequest checkoutRequest,
      String idUser,
      String idBsu) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(checkoutBSUUrl));
      Map<String, String> body = {
        'id_user': idUser,
        'id_bsu': idBsu,
        'id_gudang': checkoutRequest.idGudang,
        'tgl_transaksi': checkoutRequest.tglTransaksi,
        'tgl_jatuh_tempo': checkoutRequest.tglJatuhTempo,
        'keterangan': checkoutRequest.keterangan ?? "",
        'total_tagihan': checkoutRequest.totalTagihan,
      };
      checkoutRequest.harga.asMap().forEach((key, value) {
        body["harga[$key]"] = value;
      });
      checkoutRequest.kuantitasTimbang.asMap().forEach((key, value) {
        body["kuantitas_timbang[$key]"] = value;
      });
      checkoutRequest.idsSampah.asMap().forEach((key, value) {
        body["id_sampah[$key]"] = value;
      });
      request.fields.addAll(body);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        if (res["status"] == "true") {
          return const Right(true);
        } else {
          return Left(ServerFailure(res["result"].toString()));
        }
      } else {
        throw ServerException();
      }
    } on ServerException {
      return Left(ServerFailure("Internal Server Error"));
    } on SocketException {
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }
}
