import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/test/checkout_bsu_request.dart';
import 'package:bank_sampah/test/gudang_model/gudang_model.dart';
import 'package:bank_sampah/utils/api_constants.dart';
import 'package:dartz/dartz.dart';

import '../core/base_response_list.dart';
import '../utils/exception.dart';
import '../utils/failure.dart';
import 'package:http/http.dart' as http;

class TestServices {
  Future<Either<Failure, bool>> checkout(CheckoutBSURequest checkoutRequest,
      String idBSU, String idNasabah) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(checkoutBSUUrl));
      Map<String, String> body = {
        'id_user': idBSU,
        'id_nasabah': idNasabah,
        'tgl_transaksi': checkoutRequest.transactionDate,
        'tgl_jatuh_tempo': checkoutRequest.transactionEndDate,
        'keterangan': checkoutRequest.note,
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

  Future<Either<Failure, BaseResponseList<GudangModel>?>>
      getListGudang() async {
    try {
      final response = await http.get(Uri.parse(getListGudangUrl));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        if (data["status"] == "true") {
          final result = BaseResponseList<GudangModel>.fromJson(data, (data) {
            List<GudangModel> nasabahCategory =
                data.map((e) => GudangModel.fromJson(e)).toList();
            return nasabahCategory;
          });
          return Right(result);
        } else {
          return Left(ServerFailure(data["result"].toString()));
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
