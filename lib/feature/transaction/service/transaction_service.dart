import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/transaction/model/filter_model.dart';
import 'package:dartz/dartz.dart';

import '../../../utils/api_constants.dart';
import '../../../utils/exception.dart';
import '../../../utils/failure.dart';
import '../../dashboard/model/transaction_model.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<Either<Failure, TransactionModel?>> getListTransaction(String id,
      int record, int recordPerPage, FilterModel? filterModel) async {
    try {
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

      if (filterModel?.isCancelled == true) {
        map["filter_status[$indexStatus]"] = "dibatalkan";
        indexStatus += 1;
      }
      if (filterModel?.isSuccess == true) {
        map["filter_status[${indexStatus + 1}]"] = "selesai";
        map["filter_status[${indexStatus + 2}]"] = "lunas";
      }
      print(map);
      var request = http.MultipartRequest(
          "POST", Uri.parse("$getListTransactionDashboardUrl$id"));
      request.fields.addAll(map);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
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
}
