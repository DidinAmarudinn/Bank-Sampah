import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/dashboard/model/slider_model.dart';
import 'package:bank_sampah/feature/dashboard/model/transaction_model.dart';
import 'package:bank_sampah/feature/dashboard/model/user_balance_model.dart';
import 'package:bank_sampah/utils/api_constants.dart';
import 'package:bank_sampah/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../core/base_response.dart';
import '../../../core/base_response_list.dart';
import '../../../utils/exception.dart';

class DashboardService {
  Future<Either<Failure, UserBalance?>> getUserBalance(
      String? type, int id) async {
    try {
      String url = "$getUserBalanceUrl/$type/$id";
      final response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        if (res["status"] == "true") {
          return Right(UserBalance.fromJson(res));
        } else {
          return const Right(null);
        }
      } else {
        return Left(ServerFailure("Internal Server Error"));
      }
    } on ServerException {
      return Left(ServerFailure("Internal Server Error"));
    } on SocketException {
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  Future<Either<Failure, TransactionModel?>> getListTransaction(
      int id, int record, int recordPerPage) async {
    try {
      var map = <String, String>{};
      map['record'] = "$record";
      map["recordPerPage"] = "$recordPerPage";
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

  Future<Either<Failure, BaseResponseList<SliderModel?>>> getSlider(
      String? page) async {
    try {
      var map = <String, String>{};
      var request = http.MultipartRequest(
          "POST", Uri.parse("$getListSliderUrl$page"));
      request.fields.addAll(map);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        if (res["status"] == "true") {
        final result = BaseResponseList<SliderModel>.fromJson(res, (data) {
            List<SliderModel> sliders =
                data.map((e) => SliderModel.fromJson(e)).toList();
            return sliders;
          });
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
