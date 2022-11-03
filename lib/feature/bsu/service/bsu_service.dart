import 'dart:convert';
import 'dart:io';

import 'package:bank_sampah/feature/bsu/model/penagihan_model.dart';
import 'package:bank_sampah/feature/bsu/model/penimbangan_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base_response_list.dart';
import '../../../utils/api_constants.dart';
import '../../../utils/exception.dart';
import '../../../utils/failure.dart';
import 'package:http/http.dart' as http;

class BSUService {
  Future<Either<Failure, BaseResponseList<PenagihanModel>?>> getPenagihan(
      String idBsu) async {
    try {
      var map = <String, String>{};
      map['jenis'] = "penagihan";
      var request = http.MultipartRequest(
          "POST", Uri.parse("$getListPenjualanBSUUrl$idBsu"));
      request.fields.addAll(map);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        print(res);
        if (res["status"] == "true") {
          final result = BaseResponseList<PenagihanModel>.fromJson(res, (data) {
            List<PenagihanModel> penagihan =
                data.map((e) => PenagihanModel.fromJson(e)).toList();
            return penagihan;
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

  Future<Either<Failure, BaseResponseList<PenimbanganModel>?>> getPenimbangan(
      String idBsu) async {
    try {
      var map = <String, String>{};
      map['jenis'] = "penimbangan";
      var request = http.MultipartRequest(
          "POST", Uri.parse("$getListPenjualanBSUUrl$idBsu"));
      request.fields.addAll(map);
      var reqResponse = await request.send();
      if (reqResponse.statusCode == 200) {
        var response = await http.Response.fromStream(reqResponse);
        var res = json.decode(response.body);
        if (res["status"] == "true") {
          final result =
              BaseResponseList<PenimbanganModel>.fromJson(res, (data) {
            List<PenimbanganModel> penimbangan =
                data.map((e) => PenimbanganModel.fromJson(e)).toList();
            return penimbangan;
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
