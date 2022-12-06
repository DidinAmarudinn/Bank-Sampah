import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/transaction/model/detail_transaction_nasabah_model.dart';
import 'package:bank_sampah/feature/transaction/model/filter_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base_response.dart';
import '../../../utils/api_constants.dart';
import '../../../utils/exception.dart';
import '../../../utils/failure.dart';
import '../../dashboard/model/transaction_model.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<Either<Failure, TransactionModel?>> getListTransaction(
    String id,
    int record,
    int recordPerPage,
    FilterModel? filterModel,
    bool isBsu, {
    bool? isDone,
    bool? isOnProgress,
    bool? isCanceled,
  }) async {
    try {
      String url = "";
      if (isBsu) {
        url = "${getListTransactionDashboardUrl}list_transaksi_bsu/$id";
      } else {
        url = "${getListTransactionDashboardUrl}list_transaksi_nasabah/$id";
      }
      var map = <String, String>{};
      var index = 0;
      var indexStatus = 0;
      map['record'] = "$record";
      map["recordPerPage"] = "$recordPerPage";
      if (filterModel?.isOjekHarian == true) {
        map["filter_tipe[$index]"] = "ojek_sampah";
        index += 1;
      }
      if (filterModel?.isListrik == true) {
        map["filter_tipe[$index]"] = "listrik";
        index += 1;
      }
      if (filterModel?.isPulsa == true) {
        map["filter_tipe[$index]"] = "pulsa";
        index += 1;
      }

      if (filterModel?.isPdam == true) {
        map["filter_tipe[$index]"] = "PDAM";
        index += 1;
      }

      if (isDone == true) {
        map["filter_status[$indexStatus]"] = "selesai";
        map["filter_status[${indexStatus + 1}]"] = "lunas";
        map["filter_status[${indexStatus + 2}]"] = "berhasil";
      }

      if (isOnProgress == true) {
        map["filter_status[$indexStatus]"] = "lunas";
        map["filter_status[${indexStatus + 1}]"] = "belum dibayar";
        map["filter_status[${indexStatus + 2}]"] = "dibayar sebagian";
        map["filter_status[${indexStatus + 3}]"] = "pengajuan";
        map["filter_status[${indexStatus + 4}]"] = "proses";
      }

      if (isCanceled == true) {
        map["filter_status[$indexStatus]"] = "dibatalkan";
        map["filter_status[${indexStatus + 1}]"] = "overdue";
        map["filter_status[${indexStatus + 2}]"] = "gagal";
        map["filter_status[${indexStatus + 3}]"] = "ditolak";
      }

      var request = http.MultipartRequest("POST", Uri.parse(url));
      request.fields.addAll(map);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        print(res);
        if (res["status"] == "true") {
          final result = TransactionModel.fromJson(res);
          return Right(result);
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

  Future<Either<Failure, BaseResponse<DetailTransactionNasabahModel>?>>
      getDetailTransaction(String idTransaction) async {
    try {
      final response = await http
          .get(Uri.parse("$getDetailTransactionNasabahURL$idTransaction"));
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        if (res["status"] == "true") {
          final result = BaseResponse<DetailTransactionNasabahModel>.fromJson(
              res, (data) => DetailTransactionNasabahModel.fromJson(data));
          return Right(result);
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
