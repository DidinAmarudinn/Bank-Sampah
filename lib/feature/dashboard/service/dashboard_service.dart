import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/dashboard/model/slider_model.dart';
import 'package:bank_sampah/feature/dashboard/model/transaction_model.dart';
import 'package:bank_sampah/feature/dashboard/model/user_balance_model.dart';
import 'package:bank_sampah/utils/api_constants.dart';
import 'package:bank_sampah/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../core/base_response_list.dart';
import '../../../utils/exception.dart';
import '../../nasabah/model/nasabah_model.dart';

class DashboardService {
  Future<Either<Failure, UserBalance?>> getUserBalance(
      String? type, String id) async {
    try {
      String url = "$getUserBalanceUrl/$type/$id";
      final response = await http.post(Uri.parse(url));
      print(response.body);
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

  Future<Either<Failure, NasabahModel?>> getDataNsabah(int userId) async {
    try {
      final response = await http.get(Uri.parse("$getDataNsabahUrl$userId"));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        if (data["status"] == "true") {
          final result = BaseResponseList<NasabahModel>.fromJson(data, (data) {
            List<NasabahModel> nasabahList =
                data.map((e) => NasabahModel.fromJson(e)).toList();
            return nasabahList;
          });
          return Right(result.data?[0]);
        } else {
          return const Right(null);
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

  Future<Either<Failure, TransactionModel?>> getListTransaction(
      String id, int record, int recordPerPage, bool isBsu) async {
    try {
      String url = "";
      if (isBsu) {
        url = "${getListTransactionDashboardUrl}list_transaksi_bsu/$id";
      } else {
        url = "${getListTransactionDashboardUrl}list_transaksi_nasabah/$id";
      }
      var map = <String, String>{};
      map['record'] = "$record";
      map["recordPerPage"] = "$recordPerPage";
      var request = http.MultipartRequest("POST", Uri.parse(url));
      request.fields.addAll(map);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        if (res["status"] == "true") {
          try {
  final result = TransactionModel.fromJson(res);
          return Right(result);
          } catch (e) {
            print(e);
            return Left(ServerFailure("Error Decoding"));
          }
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
      var request =
          http.MultipartRequest("POST", Uri.parse("$getListSliderUrl$page"));
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
